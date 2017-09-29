//
//  HeepConnections.swift
//  mobile_ios
//
//  Created by Jercerb on 4/21/17.
//  Copyright © 2017 Heep. All rights reserved.
//

//import SwiftSocket
import Foundation
import Socket

class HeepConnections {
    
    public func SearchForHeepDeviecs() {
        print("Need to reset...")
        database().resetActiveDevices()
        
        let gateway = getWiFiGateway()
        
        let message = HAPIMemoryParser().BuildIsHeepDeviceCOP()
        print(message)
        for ip in 1...255 {
            let thisAddress = getAddress(gateway: gateway, ip: ip)
            self.ConnectToHeepDevice(ipAddress: thisAddress, printErrors: false, message: message)
        }
    }
    
    public func sendValueToHeepDevice(deviceID: Int, controlID: Int, currentValue: Int) {
    
        database().getDeviceIdentity(deviceID: deviceID) { thisDevice in
            
            let thisDeviceIP = thisDevice.ipAddress
            
            let message = HAPIMemoryParser().BuildSetValueCOP(controlID: controlID, newValue: currentValue)
            print("Sending: \(message.map { String(format: "%02hhx", $0) }) to Heep Device at to \(thisDeviceIP)")
            self.ConnectToHeepDevice(ipAddress: thisDeviceIP, printErrors: false, message: message)
            
        }
    }
    
    
    public func sendSetVertexToHeepDevice(activeVertex: Vertex) {
        
        database().getDeviceIdentity(deviceID: (activeVertex.tx?.deviceID)!) { txDevice in
            
            database().getDeviceIdentity(deviceID: (activeVertex.rx?.deviceID)!) { rxDevice in
                
                let message = HAPIMemoryParser().BuildSetVertexCOP(vertex: activeVertex, ipAddress: rxDevice.ipAddress)
                
                print("Sending: \(message) to Heep Device at \(txDevice.ipAddress)")
                
                self.ConnectToHeepDevice(ipAddress: txDevice.ipAddress, printErrors: false, message: message)
                
            }
        }
    }
    
    public func sendDeleteVertexToHeepDevice(activeVertex: Vertex) {
        
        database().getDeviceIdentity(deviceID: (activeVertex.tx?.deviceID)!) { txDevice in
            
            database().getDeviceIdentity(deviceID: (activeVertex.rx?.deviceID)!) { rxDevice in
                
                let message = HAPIMemoryParser().BuildDeleteVertexCOP(vertex: activeVertex, ipAddress: rxDevice.ipAddress)
                
                print("Sending: \(message) to Heep Device at \(txDevice.ipAddress)")
                
                self.ConnectToHeepDevice(ipAddress: txDevice.ipAddress, printErrors: false, message: message)
                
            }
        }
    }
    
    public func sendAssignAdminToHeepDevice(deviceID: Int) {
        
        database().getMyHeepID() { heepID in
            print("Admin's HeepID: \(String(describing: heepID))")
            
            /*
             let realm = try! Realm(configuration: configUser)
             let thisDevice = realm.object(ofType: Device.self, forPrimaryKey: deviceID)
             let thisDeviceIP = thisDevice?.ipAddress
             
             let MOP = HAPIMemoryParser().BuildAdminMOP(deviceID: deviceID, adminID: adminID!)
             let message = HAPIMemoryParser().BuildStoreMOPCOP(byteArray: MOP)
             
             print("Sending: \(message) to Heep Device at \(thisDeviceIP!)")
             
             ConnectToHeepDevice(ipAddress: thisDeviceIP!, printErrors: false, message: message)
             */
        }
        
        
    }
    
    func ConnectToHeepDevice(ipAddress: String, printErrors: Bool, message: [UInt8]) {
        DispatchQueue.global().async {
            
            if let socket = try? Socket.create(family: .inet) {
                
                if let _ = try? socket.connect(to: ipAddress, port: Int32(5000), timeout: 1000) {
                    print("connected to \(ipAddress)")
                    
                    let messageData = NSData(bytes: message, length: message.count)
                    try! socket.write(from: messageData)
                
                    var data = Data()
                    data.count = 0
                    
                    if let _ = try? socket.read(into: &data) {
                        HAPIMemoryParser().ParseROP(dump: data.map{$0}, ipAddress: ipAddress)
                    }
                    
                    
                    socket.close()
                    
                } else {
                    socket.close()
                }
                
            }
            
        }
    }
    
    func readAndPrint(socket: Socket, data: inout Data) throws -> String? {
        print("Trying to read")
        
        data.count = 0
        let bytesRead = try socket.read(into: &data)
        print(bytesRead)
        
        if bytesRead > 0 {
            
            print("Read \(bytesRead) from socket...")
            
            guard let response = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue) else {
                
                print("Error accessing received data...")
                
                return nil
            }
            
            print("Response:\n\(response)")
            return String(describing: response)
        }
        
        return nil
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
                    
                    let gatewayArray = address.characters.split(separator: ".").map(String.init)
                    
                    if (gatewayArray.count == 4) {
                        gateway = gatewayArray[0...2].joined(separator: ".")
                        break
                    }
                    
                }
            }
        }
        freeifaddrs(ifaddr)
        
        print("GATEWAY: \(gateway)")
        return gateway
    }
    
    
    
    func getAddress(gateway: String, ip: Int) -> String {
        
        return gateway + "." + String(ip)
    }
    
    
    
}
