//
//  Utilities.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/14/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import Foundation
import SystemConfiguration.CaptiveNetwork


func getRandomColor() -> UIColor{
    //Generate between 0 to 1
    let red:CGFloat = CGFloat(drand48())
    let green:CGFloat = CGFloat(drand48())
    let blue:CGFloat = CGFloat(drand48())
    
    return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
}

func currentWifiInfo(){
    if let interface = CNCopySupportedInterfaces() {
        for i in 0..<CFArrayGetCount(interface) {
            let interfaceName: UnsafeRawPointer = CFArrayGetValueAtIndex(interface, i)
            let rec = unsafeBitCast(interfaceName, to: AnyObject.self)
            if let unsafeInterfaceData = CNCopyCurrentNetworkInfo("\(rec)" as CFString), let interfaceData = unsafeInterfaceData as? [String : AnyObject] {
                // connected wifi
                print("BSSID: \(String(describing: interfaceData["BSSID"])), SSID: \(String(describing: interfaceData["SSID"])), SSIDDATA: \(String(describing: interfaceData["SSIDDATA"]))")
                
                let ssid = interfaceData["SSID"] as! String
                let bssid = interfaceData["BSSID"] as! String
                currentWifi["ssid"] = ssid
                currentWifi["bssid"] = bssid
                print(currentWifi["ssid"])
                
            } else {
                // not connected wifi
            }
        }
    }
    
    
}

