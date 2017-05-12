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
    
    var name: String = "placeholder"
    var deviceID: Int = 0
    var version: Int = 0
    var iconName: String = "lightbulb"
    var ipAddress: String = "0.0.0.0"
    var controlList =  List<DeviceControl>()
    
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
    
    var deviceID: Int
    var controlID: Int
    var controlType: Int
    var controlDirection: Int
    var valueLow: Int
    var valueHigh: Int
    var valueCurrent: Int
    var controlName: String
    
    init(deviceID: Int,
         controlID: Int,
         controlType: Int,
         controlDirection: Int,
         valueLow: Int,
         valueHigh: Int,
         valueCurrent: Int,
         controlName: String) {
        
        self.deviceID = deviceID
        self.controlID = controlID
        self.controlType = controlType
        self.controlDirection = controlDirection
        self.valueLow = valueLow
        self.valueHigh = valueHigh
        self.valueCurrent = valueCurrent
        self.controlName = controlName
    }
    
    
}

