//
//  HeepConnections.swift
//  mobile_ios
//
//  Created by Jercerb on 4/21/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import SwiftSocket
import RealmSwift
import Foundation

class HeepConnections {
    
    public func SearchForHeepDeviecs() {
        
        let gateway = getWiFiGateway()
        
        let message = HAPIMemoryParser().BuildIsHeepDeviceCOP()
        
        for ip in 1...255 {
            let thisAddress = getAddress(gateway: gateway, ip: ip)
            DispatchQueue.global().async {
                
                self.ConnectToHeepDevice(ipAddress: thisAddress, printErrors: false, message: message) { (data, ipAddress) in
                    HAPIMemoryParser().ParseROP(dump: data, ipAddress: ipAddress)
                }
                
            }
            
        }
    }
    
    public func sendValueToHeepDevice(uniqueID: Int, currentValue: Int = -1) {
    
        var newVal = -1
        let realm = try! Realm(configuration: configUser)
        let activeControl = realm.object(ofType: DeviceControl.self, forPrimaryKey: uniqueID)
        let thisDevice = realm.object(ofType: Device.self, forPrimaryKey: activeControl?.deviceID)
        let thisDeviceIP = thisDevice?.ipAddress
        let thisControl = activeControl?.controlID
        
        
        if currentValue == -1 {
            newVal = (activeControl?.valueCurrent)!
        }
        else{
            newVal = currentValue
        }
        
        let message = HAPIMemoryParser().BuildSetValueCOP(controlID: thisControl!, newValue: newVal)
        print("Sending: \(message) to Heep Device at to \(thisDeviceIP!)")
        ConnectToHeepDevice(ipAddress: thisDeviceIP!, printErrors: false, message: message){ (data, ipAddress) in
            HAPIMemoryParser().ParseROP(dump: data, ipAddress: ipAddress)
        }

        
        
    }
    
    
    public func sendSetVertexToHeepDevice(activeVertex: Vertex) {
        
        let realm = try! Realm(configuration: configUser)
        let thisDevice = realm.object(ofType: Device.self, forPrimaryKey: activeVertex.tx?.deviceID)
        let thisDeviceIP = thisDevice?.ipAddress
        let message = HAPIMemoryParser().BuildSetVertexCOP(vertex: activeVertex)
        
        print("Sending: \(message) to Heep Device at \(thisDeviceIP!)")
        
        ConnectToHeepDevice(ipAddress: thisDeviceIP!, printErrors: false, message: message){ (data, ipAddress) in
            HAPIMemoryParser().ParseROP(dump: data, ipAddress: ipAddress)
        }

    }
    
    public func sendDeleteVertexToHeepDevice(activeVertex: Vertex) {
        
        let realm = try! Realm(configuration: configUser)
        
        let thisDevice = realm.object(ofType: Device.self, forPrimaryKey: activeVertex.tx?.deviceID)
        let thisDeviceIP = thisDevice?.ipAddress
        let message = HAPIMemoryParser().BuildDeleteVertexCOP(vertex: activeVertex)
        print("Sending: \(message) to Heep Device at \(thisDeviceIP!)")
        
        ConnectToHeepDevice(ipAddress: thisDeviceIP!, printErrors: false, message: message){ (data, ipAddress) in
            HAPIMemoryParser().ParseROP(dump: data, ipAddress: ipAddress)
        }

    }
    
    public func sendAssignAdminToHeepDevice(deviceID: Int, adminID: Int) {
        
        let realm = try! Realm(configuration: configUser)
        
        guard let thisDevice = realm.object(ofType: Device.self, forPrimaryKey: deviceID) else {
            print("Could not retrieve this device from realm. Canceling COP")
            return
        }
        
        let thisDeviceIP = thisDevice.ipAddress
        
        let MOP = HAPIMemoryParser().BuildAdminMOP(deviceID: deviceID, adminID: adminID)
        let message = HAPIMemoryParser().BuildStoreMOPCOP(byteArray: MOP)
        
        print("Sending: \(message) to Heep Device at \(thisDeviceIP)")
        
        ConnectToHeepDevice(ipAddress: thisDeviceIP, printErrors: false, message: message){ (data, ipAddress) in
            HAPIMemoryParser().ParseROP(dump: data, ipAddress: ipAddress)
        }

        
    }
    
    public func sendControlContextMOPToHeepDevice(deviceID: Int, controlUniqueID: Int) {
        
        let realm = try! Realm(configuration: configUser)
        
        guard let thisDevice = realm.object(ofType: Device.self, forPrimaryKey: deviceID) else {
            print("Could not retrieve this device from realm. Canceling COP")
            return
        }
        
        guard let thisControl = realm.object(ofType: DeviceControl.self, forPrimaryKey: controlUniqueID) else {
            print("Could not retrieve this control from realm. Canceling MOPCOP")
            return
        }
        
        
        
        let MOP = HAPIMemoryParser().BuildControlContextMOP(controlContext: thisControl)
        let message = HAPIMemoryParser().BuildStoreMOPCOP(byteArray: MOP)
        
        print("Sending: \(message) to Heep Device at \(thisDevice.ipAddress)")
        
        replaceExistingMOP(deviceIP: thisDevice.ipAddress,
                           MOPidentifier: 0x1A,
                           message: message)
        
        //ConnectToHeepDevice(ipAddress: thisDeviceIP, printErrors: false, message: message)
        
    }
    
//    func replaceExistingMOP(deviceIP: String, MOPidentifier: UInt8, message: [UInt8]) {
//        
//        guard let dump = requestMemoryDumpFromDevice(deviceIP: deviceIP) else {
//            print("Could not retrieve memory dump from device")
//            return
//        }
//        
//        guard let targetMOP = HAPIMemoryParser().searchForSpecificMOP(dump: dump, targetMOP: MOPidentifier) else {
//            print("Did not find target MOP in memory dump")
//            return
//        }
//        
//        print("TARGET MOP SUCCESS: \(targetMOP)")
//        
//        //sendFragmentCOPToDevice()
//        //SendReplacementMOPToDevice()
//        
//        
//    }
    
    func replaceExistingMOP(deviceIP: String, MOPidentifier: UInt8, message: [UInt8]) {
        let requestDumpMessage = HAPIMemoryParser().BuildIsHeepDeviceCOP()
        
        ConnectToHeepDevice(ipAddress: deviceIP, printErrors: false, message: requestDumpMessage) { (data, ipAddress) in
            
            self.checkIfMOPPresentAndHandle(deviceIP: deviceIP,
                                            MOPidentifier: MOPidentifier,
                                            message: message,
                                            data: data,
                                            ipAddress: ipAddress)
            
        }

    }
    
    func checkIfMOPPresentAndHandle(deviceIP: String, MOPidentifier: UInt8, message: [UInt8], data: [UInt8], ipAddress: String) {
        
        guard let targetMOP = HAPIMemoryParser().searchForSpecificMOP(dump: data, targetMOP: MOPidentifier) else {
            print("Did not find target MOP \(MOPidentifier) in memory dump. Writing now.")
            
            self.ConnectToHeepDevice(ipAddress: deviceIP, printErrors: false, message: message) { (data, ipAddress) in
                HAPIMemoryParser().ParseROP(dump: data, ipAddress: ipAddress)
            }
            return
        }
        
        print("DETECTED THE TARGET MOP: \(targetMOP)")
        
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 2) {
            let deleteMOPCOP = HAPIMemoryParser().BuildDeleteMOPCOP(MOP: targetMOP)
            print("SENDING DELETE MOP COP: \(deleteMOPCOP)")
            
            self.ConnectToHeepDevice(ipAddress: deviceIP, printErrors: false, message: deleteMOPCOP) { (data, ipAddress) in
                HAPIMemoryParser().ParseROP(dump: data, ipAddress: ipAddress)
            }
            
        }
        
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + 4) {
        
            print("SENDING UPDATED MOP: \(message)")
            self.ConnectToHeepDevice(ipAddress: deviceIP, printErrors: false, message: message) { (data, ipAddress) in
                HAPIMemoryParser().ParseROP(dump: data, ipAddress: ipAddress)
            }
        }
    }
    
    
    func ConnectToHeepDevice(ipAddress: String, printErrors: Bool, message: [UInt8], callback: @escaping ([UInt8], String) -> Void = {_,_ in }) {
        
        let client = TCPClient(address: ipAddress, port:5000)
        
        switch client.connect(timeout:1){
        case .success:
            print("success")
            
            switch client.send(data: message) {
                
            case .success:
                guard let data = client.read(1024*10) else { return }
                
                client.close()
                callback(data, ipAddress)
                
            case .failure(let error):
                if (printErrors) {
                    print(error)
                }
            }
        case .failure(let error):
            if (printErrors) {
                print(error)
            }
        }
        

    }
    
    // Return IP address of WiFi interface (en0) as a String, or `nil`
    func getWiFiGateway() -> String {
        var address = "10.0.0.1"
        var gateway = "10.0.0"
        
        
        // Get list of all interfaces on the local machine:
        var ifaddr : UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else { return gateway }
        guard let firstAddr = ifaddr else { return gateway }
        
        // For each interface ...
        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ifptr.pointee
            
            // Check for IPv4 or IPv6 interface:
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                
                // Check interface name:
                let name = String(cString: interface.ifa_name)

                if  name == "en0" {
                    
                    // Convert interface address to a human readable string:
                    var addr = interface.ifa_addr.pointee
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(&addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                &hostname, socklen_t(hostname.count),
                                nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostname)
                }
            }
        }
        freeifaddrs(ifaddr)
        
        
        let gatewayArray = address.characters.split(separator: ".").map(String.init)
        gateway = gatewayArray[0...2].joined(separator: ".")
        
        return gateway
    }
    
    
    
    func getAddress(gateway: String, ip: Int) -> String {
        
        return gateway + "." + String(ip)
    }
    
    
}
