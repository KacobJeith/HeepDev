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
import RealmSwift
//import CommonCrypto.CommonCrypto
var userKey = String()

func flushApp() {
    
    let realmGuest = try! Realm(configuration: configGuest)
    try! realmGuest.write {
        realmGuest.deleteAll()
    }
    
}

func SuggestIconFromName(name: String, state: Int = -1, lowVal: Int = 0) -> String {
    var suggestion = "switch"
    
    if ( name.lowercased().range(of: "outlet") != nil){
        suggestion = "outlet"
    }
    
    
    if (name.lowercased().range(of: "light") != nil ||
        name.lowercased().range(of: "bulb") != nil ||
        name.lowercased().range(of: "relay") != nil ||
        name.lowercased().range(of: "LED") != nil) {
        
        if state == lowVal{
            suggestion = "light_off"
        }
        else {
            suggestion = "light_on"
        }
        
    }
    
    if name.lowercased().range(of: "dimmer") != nil {
        suggestion = "dimmer"
    }
    
    if name.lowercased().range(of: "red") != nil {
        suggestion = "red_icon"
    }
    if name.lowercased().range(of: "green") != nil {
        suggestion = "green_icon"
    }
    if name.lowercased().range(of: "blue") != nil {
        suggestion = "blue_icon"
    }
    
    if ( name.lowercased().range(of: "switch") != nil){
        suggestion = "switch"
    }
    
    return suggestion
}


func SuggestColorFromName(name: String) -> UIColor {
    var suggestion = UIColor(colorLiteralRed: 1.0, green: 0.93, blue: 0.26, alpha: 1.0)

    
    if name.lowercased().range(of: "red") != nil {
        suggestion = UIColor.red
    }
    if name.lowercased().range(of: "green") != nil {
        suggestion = UIColor.green
    }
    if name.lowercased().range(of: "blue") != nil {
        suggestion = UIColor.blue
    }
    
    return suggestion
}


func getControlValueRatio(control: DeviceControl) -> CGFloat{
    if control.controlType == 0{
        return CGFloat(control.valueCurrent)
    }
    else{
        let ratio = CGFloat(control.valueHigh - control.valueCurrent) / CGFloat( control.valueHigh - control.valueLow)
        return ratio
    }
}

func lessThanTimeInterval(start: DispatchTime, end: DispatchTime, timeInterval: UInt64) -> Bool {
    let elapsed = end.uptimeNanoseconds - start.uptimeNanoseconds
    
    if(elapsed < timeInterval){
//        print("LESS THAN TIMEINTERVAL")
        return true
    }
    else{
//        print("GR8R THAN TIMEINTERVAL")
        return false
    }
}

func toggleDevice(control: DeviceControl ) -> Int{
    
    print(control)
    
    //If control type is a switch or binary on/off
    if control.controlType == 0{
        return 1 - control.valueCurrent
    }
    
    if control.valueCurrent != control.valueLow {
        return control.valueLow
    }
    else{
        return control.lastOnValue
    }
    
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

func hashString(name:String, string:String) -> Data? {
    let data = string.data(using:.utf8)!
    return hashData(name:name, data:data)
}

func hashData(name:String, data:Data) -> Data? {
    let algos = ["MD2":    (CC_MD2,    CC_MD2_DIGEST_LENGTH),
                 "MD4":    (CC_MD4,    CC_MD4_DIGEST_LENGTH),
                 "MD5":    (CC_MD5,    CC_MD5_DIGEST_LENGTH),
                 "SHA1":   (CC_SHA1,   CC_SHA1_DIGEST_LENGTH),
                 "SHA224": (CC_SHA224, CC_SHA224_DIGEST_LENGTH),
                 "SHA256": (CC_SHA256, CC_SHA256_DIGEST_LENGTH),
                 "SHA384": (CC_SHA384, CC_SHA384_DIGEST_LENGTH),
                 "SHA512": (CC_SHA512, CC_SHA512_DIGEST_LENGTH)]
    guard let (hashAlgorithm, length) = algos[name]  else { return nil }
    var hashData = Data(count: Int(length))
    
    _ = hashData.withUnsafeMutableBytes {digestBytes in
        data.withUnsafeBytes {messageBytes in
            hashAlgorithm(messageBytes, CC_LONG(data.count), digestBytes)
        }
    }
    return hashData
}

extension String {
    var asciiArray: [UInt32] {
        return unicodeScalars.filter{$0.isASCII}.map{$0.value}
    }
}

func getIDFromByteArray(bytes: [UInt32]) -> Int {
    let id1: Int = Int(bytes[0])
    let id2: Int = Int(bytes[1])
    let id3: Int = Int(bytes[2])
    let id4: Int = Int(bytes[3])
    
    let finalID = (id1 << 24) + (id2 << 16) + (id3 << 8) + id4
    
    return finalID
}



func getUserIcon(iconURL: String) -> NSData {
    let url = URL(string: iconURL)
    let data = try? Data(contentsOf: url!)
    
    return data! as NSData
}




func convertIntToByteArray(integer: Int, size: Int = 0) -> [UInt8] {
    var byteArray = [UInt8]()
    for index in 0...(calcNumBytes(integer: integer) - 1) {
        byteArray.append(UInt8(truncatingBitPattern: integer >> (index * 8)))
    }
    if byteArray.count < size {
        byteArray.append(contentsOf: [UInt8](repeating: 0, count: size - byteArray.count))

    }
    print("size: \(size), actual: \(byteArray.count)")
    
    return byteArray.reversed()
}

func calcNumBytes(integer: Int) -> Int {
    var numBytesRequired = 1
    
    while integer > (2 << (numBytesRequired * 8 - 1)) {
        numBytesRequired += 1
    }
    
    return numBytesRequired
}

func convertArrayToInt(byteArray: [UInt8], reverse: Bool = false) -> Int {
    var integer = 0
    var currentIndex = 0
    var isReversed = byteArray
    
    if reverse {
        isReversed = byteArray.reversed()
    }
    
    for nextByte in isReversed {
        integer += (Int(nextByte) << currentIndex)
        currentIndex += 8
    }
    
    return integer
}

extension Results {
    
    func toArray() -> [T] {
        return self.map{$0}
    }
}

extension RealmSwift.List {
    
    func toArray() -> [T] {
        return self.map{$0}
    }
}

