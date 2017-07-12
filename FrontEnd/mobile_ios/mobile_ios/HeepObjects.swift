//
//  User.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/10/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import Foundation
import RealmSwift

// Public Realm
class User: Object {
    
    dynamic var heepID: Int = 0
    dynamic var realmKey: String = ""
    dynamic var facebookID: Int = 0
    dynamic var name: String = "guest"
    dynamic var email: String = ""
    dynamic var iconURL: String = ""
    dynamic var icon: NSData = (UIImagePNGRepresentation((UIImage(named: "female"))!))! as NSData
    
    override static func primaryKey() -> String? {
        return "heepID"
    }
    
}

// Device Realm
class Key: Object {
    dynamic var accessCode: Int = 0
    dynamic var publicKey: Int = 0
    dynamic var type: Int = 0
    
    override static func primaryKey() -> String? {
        return "type"
    }
}

// User Realm
class Place: Object {
    
    dynamic var ssid: String = "placeholder"
    dynamic var bssid: String = "LANMAC"
    dynamic var name: String = "unnamed"
    dynamic var gateway: String = "0.0.0"
    dynamic var x: CGFloat = 100
    dynamic var y: CGFloat = 100
    dynamic var radius: Int = 100
    dynamic var update: Bool = false
    let devices = List<Device>()
    let groups = List<Group>()
    
    override static func primaryKey() -> String? {
        return "bssid"
    }
}

// User Realm
class Group: Object {
    
    let controls = List<DeviceControl>()
    dynamic var name: String = "Unassigned"
    dynamic var place: String = "none"
    dynamic var id: Int = 0
    dynamic var imageData: NSData = NSData()
    dynamic var selectedControl: Int = 0
    dynamic var unassignedOffsetX: CGFloat = 0
    dynamic var assignedOffsetX: CGFloat = 0
    dynamic var contentOffsetX: CGFloat = 0
    dynamic var contentOffsetY: CGFloat = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

// User Realm
class Device: Object {
    
    dynamic var name: String = "placeholder"
    dynamic var deviceID: Int = 0
    dynamic var humanAdmin: Int = 0
    dynamic var version: Int = 0
    dynamic var iconName: String = "lightbulb"
    dynamic var ipAddress: String = "0.0.0.0"
    let controlList =   List<DeviceControl>() //LinkingObjects(fromType: DeviceControl.self, property: "deviceID")
    dynamic var associatedPlace: String = "wanderer"
    dynamic var authorizedUsers: String = ""
    
    override static func primaryKey() -> String? {
        return "deviceID"
    }
    
    
}

// User Realm
class DeviceControl: Object {
    
    dynamic var deviceID: Int = 0
    dynamic var controlID: Int = 0
    dynamic var uniqueID: Int = 0
    dynamic var controlType: Int = 0
    dynamic var controlDirection: Int = 0
    dynamic var valueLow: Int = 0
    dynamic var valueHigh: Int = 100
    dynamic var valueCurrent: Int = 0
    dynamic var lastOnValue: Int = 100
    dynamic var controlName: String = "Default"
    dynamic var place: String = "none"
    dynamic var groupsAssigned: Int = 0
    dynamic var editX: CGFloat = 100
    dynamic var editY: CGFloat = 100
    dynamic var scale: CGFloat = 1
    dynamic var rotation: CGFloat = 0
    let vertexList = List<Vertex>()
    
    override static func primaryKey() -> String? {
        return "uniqueID"
    }
    
}

// User Realm
class Vertex: Object {
    
    dynamic var tx: DeviceControl?
    dynamic var rx: DeviceControl? 
    dynamic var vertexID: String = ""
    
    override static func primaryKey() -> String? {
        return "vertexID"
    }
    
}


extension Object {
    func propertyNames() -> [String] {
        return Mirror(reflecting: self).children.flatMap { $0.label }
    }
}

