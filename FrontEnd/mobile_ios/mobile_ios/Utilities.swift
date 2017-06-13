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

func flushApp() {
    let realmApp = try! Realm(configuration: configApp)
    try! realmApp.write {
        realmApp.deleteAll()
    }
    
    let realmUser = try! Realm(configuration: configUser)
    try! realmUser.write {
        realmUser.deleteAll()
    }
}

func initializeApp() {
    let realm = try! Realm(configuration: configApp)
    
    let app = realm.object(ofType: App.self, forPrimaryKey: 0)
    
    if app == nil {
        print("Adding empty app")
        let initialApp = App()
        let initialUser = User()
        
        
        try! realm.write {
            realm.add(initialApp)
            realm.add(initialUser)
        }
    }
    
}

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

func seedNewUserAccount(name: String,
                        imageURL: String = "https://lorempixel.com/400/400/cats/",
                        id: String) -> User {
        let realm = try! Realm(configuration: configApp)
        let app = realm.object(ofType: App.self, forPrimaryKey: 0)
        let newUser = User()
        //print(actualInfo)
        
        newUser.userID = Int(id)!
        newUser.facebookID = Int(id)!
        newUser.name = name
        newUser.iconURL = imageURL
        print(newUser)
        
        try! realm.write {
            app?.activeUser = Int(id)!
            realm.add(newUser,
                      update: true)
        }
        
        let iconData = getUserIcon(iconURL: newUser.iconURL)
        
        try! realm.write {
            
            newUser.icon = iconData
        }
        print("After getting image \(newUser)")
    
    return newUser
}

func getUserIcon(iconURL: String) -> NSData {
    let url = URL(string: iconURL)
    let data = try? Data(contentsOf: url!)
    
    return data! as NSData
}

func loginToUserRealm(user: Int) {
    let realmApp = try! Realm(configuration: configApp)
    let app = realmApp.object(ofType: App.self, forPrimaryKey: 0)
    
    try! realmApp.write {
        app?.activeUser = user
    }
    
    configUser.fileURL = configUser.fileURL!.deletingLastPathComponent().appendingPathComponent("\(String(describing: user)).realm")
    
}

func convertIntToByteArray(integer: Int) -> [UInt8] {
    var byteArray = [UInt8]()
    for index in 0...(calcNumBytes(integer: integer) - 1) {
        byteArray.append(UInt8(truncatingBitPattern: integer >> (index * 8)))
    }
    
    return byteArray
}

func calcNumBytes(integer: Int) -> Int {
    var numBytesRequired = 1
    
    while integer > (2 << (numBytesRequired * 8 - 1)) {
        numBytesRequired += 1
    }
    
    return numBytesRequired
}

func convertArrayToInt(byteArray: [UInt8]) -> Int {
    var integer = 0
    var currentIndex = 0
    for nextByte in byteArray {
        integer += (Int(nextByte) << currentIndex)
        currentIndex += 8
    }
    
    return integer
}


