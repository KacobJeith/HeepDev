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

func SuggestIconFromName(name: String) -> String {
    var suggestion = "switch"
    
    if ( name.lowercased().range(of: "outlet") != nil){
        suggestion = "outlet"
    }
    
    if (name.lowercased().range(of: "light") != nil ||
        name.lowercased().range(of: "bulb") != nil ||
        name.lowercased().range(of: "relay") != nil ||
        name.lowercased().range(of: "dimmer") != nil ||
        name.lowercased().range(of: "LED") != nil) {
        suggestion = "lightbulb"
    }
    
    if ( name.lowercased().range(of: "switch") != nil){
        suggestion = "switch"
    }
    
    return suggestion
}

func getRandomColor() -> UIColor{
    //Generate between 0 to 1
    let red:CGFloat = CGFloat(arc4random_uniform(256))/255
    let green:CGFloat = CGFloat(arc4random_uniform(256))/255
    let blue:CGFloat = CGFloat(arc4random_uniform(256))/255
    
    return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
}

func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
    let length = (range.upperBound - range.lowerBound + 1).toIntMax()
    let value = arc4random().toIntMax() % length + range.lowerBound.toIntMax()
    return T(value)
}

func currentWifiInfo() -> (ssid: String, bssid:  String){
    var ssid = "none"
    var bssid = "none"
    
    if let interface = CNCopySupportedInterfaces() {
        for i in 0..<CFArrayGetCount(interface) {
            let interfaceName: UnsafeRawPointer = CFArrayGetValueAtIndex(interface, i)
            let rec = unsafeBitCast(interfaceName, to: AnyObject.self)
            if let unsafeInterfaceData = CNCopyCurrentNetworkInfo("\(rec)" as CFString), let interfaceData = unsafeInterfaceData as? [String : AnyObject] {
                // connected wifi
                //print("BSSID: \(String(describing: interfaceData["BSSID"])), SSID: \(String(describing: interfaceData["SSID"])), SSIDDATA: \(String(describing: interfaceData["SSIDDATA"]))")
                
                ssid = interfaceData["SSID"] as! String
                bssid = interfaceData["BSSID"] as! String
                //print(ssid)
                
            } else {
                // not connected wifi
            }
        }
        
    }
    
    return (ssid: ssid, bssid: bssid)
}

func nameVertex(tx: DeviceControl?, rx: DeviceControl?) -> String {
    if tx == nil || rx == nil {
        return "nil"
    }
    
    return String(describing: (tx?.uniqueID)!) + String(describing: (rx?.uniqueID)!)
}

