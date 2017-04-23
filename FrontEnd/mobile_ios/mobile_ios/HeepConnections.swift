//
//  HeepConnections.swift
//  mobile_ios
//
//  Created by Jercerb on 4/21/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import SwiftSocket

class HeepConnections {
    public static func testSocket() -> Bool {
        
        let gateway = getWiFiGateway()
        var newData = false
        
        for ip in 100...105 {
            let thisAddress = getAddress(gateway: gateway, ip: ip)
            print(thisAddress)
            
            let client = TCPClient(address: thisAddress, port:5000)
            
            switch client.connect(timeout:1){
            case .success:
                print("success")
                let bufferarray = HAPIMemoryParser.BuildIsHeepDeviceCOP()
                
                switch client.send(data: bufferarray) {
                    
                case .success:
                    guard let data = client.read(1024*10) else { return false}
                    newData = HAPIMemoryParser.ParseROP(dump: data)
                case .failure(let error):
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
            
        }
        
        return newData
    }
    
    // Return IP address of WiFi interface (en0) as a String, or `nil`
    private static func getWiFiGateway() -> String {
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
    
    private static func getAddress(gateway: String, ip: Int) -> String {
        
        return gateway + "." + String(ip)
    }
    
    
}
