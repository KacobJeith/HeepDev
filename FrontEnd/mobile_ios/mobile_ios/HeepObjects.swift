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

// Place Realm
class Place: Object {
    
    dynamic var placeID: Int = 0
    dynamic var name: String = "unnamed"
    let PHYList = List<PHY>()
    
    override static func primaryKey() -> String? {
        return "placeID"
    }
}

// Place Realm
class PHY: Object {
    
    dynamic var ssid: String = "placeholder"
    dynamic var bssid: String = "LANMAC"
    dynamic var gateway: String = "0.0.0"
    
    override static func primaryKey() -> String? {
        return "bssid"
    }
    
}

// User Realm
class PlacePerspective: Object {
    
    dynamic var placeID: Int = 0
    dynamic var realmPath: String = ""
    dynamic var x: CGFloat = 100
    dynamic var y: CGFloat = 100
    dynamic var radius: Int = 100
    dynamic var numDevices: Int = 0
    
    override static func primaryKey() -> String? {
        return "placeID"
    }
}

// Group Realm
class Group: Object {
    
    dynamic var groupID: Int = 0
    dynamic var placeID: Int = 0
    dynamic var name: String = "Unassigned"
    dynamic var imageData: NSData = NSData()
    
    override static func primaryKey() -> String? {
        return "groupID"
    }
}

// User Realm
class GroupPerspective: Object {
    
    dynamic var groupID: Int = 0
    dynamic var placeID: Int = 0 // Sync with global group realm as often as possible. This is just for easy querying
    dynamic var realmPath: String = ""
    dynamic var selectedControl: Int = 0
    dynamic var UILocked: Bool = true
    dynamic var unassignedOffsetX: CGFloat = 0
    dynamic var assignedOffsetX: CGFloat = 0
    dynamic var contentOffsetX: CGFloat = 0
    dynamic var contentOffsetY: CGFloat = 0
    
    override static func primaryKey() -> String? {
        return "groupID"
    }
}

// User Realm
class Device: Object {
    
    dynamic var deviceID: Int = 0
    dynamic var name: String = "placeholder"
    dynamic var humanAdmin: Int = 0
    dynamic var version: Int = 0
    dynamic var iconName: String = "lightbulb"
    dynamic var ipAddress: String = "0.0.0.0"
    dynamic var active: Bool = false
    let controlList =   List<DeviceControl>()
    dynamic var authorizedUsers: String = "" // actually a list, but parsed using a delimiter
    
    override static func primaryKey() -> String? {
        return "deviceID"
    }
    
    
}

// User Realm
class DeviceControl: Object {
    
    dynamic var deviceID: Int = 0
    dynamic var controlID: Int = 0
    dynamic var uniqueID: Int = 0
    dynamic var groupID: Int = 0
    dynamic var controlType: Int = 0
    dynamic var controlDirection: Int = 0
    dynamic var valueLow: Int = 0
    dynamic var valueHigh: Int = 100
    dynamic var valueCurrent: Int = 0
    dynamic var lastOnValue: Int = 100
    dynamic var controlName: String = "Default"
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
    
    func toDict() -> Dictionary<String, Any> {
        let props = self.propertyNames()
        var dict = Dictionary<String, Any>()
        
        for key in props {
            if let value = self.value(forKey: key) {
                if key.range(of: "List") == nil {
                    
                    dict[key] = value
                }
            
            }
            
        }
        
        return dict
    }
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


