//
//  User.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/10/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    
    var userID: Int = 0
    var name: String = "Guest"
    var email: String = ""
    var password: String = ""
    var keys = List<Key>()
    var devices = List<Device>()
    var places = List<Place>()
    
    override static func primaryKey() -> String? {
        return "userID"
    }
    
}

class Key: Object {
    var deviceID: Int = 0
    var deviceSecret: Int = 0
    
    override static func primaryKey() -> String? {
        return "deviceID"
    }
    
}

class Place: Object {
    
    var ssid: String = "placeholder"
    var name: String = "unnamed"
    var gateway: String = "0.0.0"
    var devices = List<Device>()
    
    override static func primaryKey() -> String? {
        return "ssid"
    }
}

class Device: Object {
    
    dynamic var name: String = "placeholder"
    dynamic var deviceID: Int = 0
    dynamic var version: Int = 0
    dynamic var iconName: String = "lightbulb"
    dynamic var ipAddress: String = "0.0.0.0"
    let controlList =   List<DeviceControl>() //LinkingObjects(fromType: DeviceControl.self, property: "deviceID")
    
    override static func primaryKey() -> String? {
        return "deviceID"
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func setIPAddress(ipAddress: String) {
        self.ipAddress = ipAddress
    }
    
    func setIconName(iconName: String){
        self.iconName = iconName
    }
    
}

class DeviceControl: Object {
    
    dynamic var deviceID: Int = 0
    dynamic var controlID: Int = 0
    dynamic var controlType: Int = 0
    dynamic var controlDirection: Int = 0
    dynamic var valueLow: Int = 0
    dynamic var valueHigh: Int = 100
    dynamic var valueCurrent: Int = 0
    dynamic var controlName: String = "Default"
    
    
    
}

