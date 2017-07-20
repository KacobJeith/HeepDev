//
//  PermissionUtilities.swift
//  mobile_ios
//
//  Created by Jacob on 6/29/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import Foundation
import RealmSwift

func createDeviceRealm(deviceID: Int) {
    let urlString = digitalOceanRealm + "/~/" + String(deviceID)
    let syncConfig = SyncConfiguration(user: SyncUser.current!,
                                       realmURL: URL(string: urlString)!)
    let configDevice = Realm.Configuration(syncConfiguration: syncConfig,
                                           objectTypes: [Key.self])
    
    let realm = try! Realm(configuration: configDevice)
    
    let newDeviceKey = Key()
    newDeviceKey.publicKey = deviceID
    newDeviceKey.accessCode = randomNumber(inRange: 0...4000000000)
    
    try! realm.write {
        realm.add(newDeviceKey, update: true)
    }
    
    print(newDeviceKey)
}

func createPlaceRealm() -> Place {
    let placeID = randomNumber(inRange: 0...4000000000)
    
    print("CREATING NEW PLACE")
    
    let urlString = digitalOceanRealm + "/~/" + String(placeID)
    let syncConfig = SyncConfiguration(user: SyncUser.current!,
                                       realmURL: URL(string: urlString)!)
    
    let configPlace = Realm.Configuration(syncConfiguration: syncConfig,
                                           objectTypes: [Place.self, PHY.self])
    
    let realm = try! Realm(configuration: configPlace)
    
    let newPlace = Place()
    newPlace.name = "New Place"
    newPlace.placeID = placeID
    
    let currentWifi = currentWifiInfo()
    
    if currentWifi.ssid != "none" {
        let newWifi = PHY()
        newWifi.bssid = currentWifi.bssid
        newWifi.ssid = currentWifi.ssid
        
        try! realm.write {
            realm.add(newWifi, update: true)
        }
        
        newPlace.PHYList.append(newWifi)
        
    }
    
    
    try! realm.write {
        realm.add(newPlace, update: true)
    }
    
    print(newPlace)
    
    return newPlace
}


func grantPermissionToOtherUser(deviceID: Int, userID: Int) {
    let realmPublic = try! Realm(configuration: configPublicSync)
    let userToGrant = realmPublic.object(ofType: User.self, forPrimaryKey: userID)
    
    let permission = SyncPermissionValue(realmPath: "/~/" + String(deviceID),
                                         userID: (userToGrant?.realmKey)!,
                                         accessLevel: .write)
    
    SyncUser.current?.applyPermission(permission) { error in
        
        if let error = error {
            print("PERMISSION UNSUCCESSFUL \(error)")
            return
        }
        
        print("Successfully added permission to new user")
        
        let realm = try! Realm(configuration: configUser)
        
        if let device = realm.object(ofType: Device.self, forPrimaryKey: deviceID) {
            
            let newUserList = device.authorizedUsers + "/" + (userToGrant?.realmKey)!
            
            try! realm.write {
                
                device.authorizedUsers = newUserList
            }
        }
        
        return
    }
    
    
}

func retrieveDeviceUsers(deviceID: Int) {
    var matchingUsers = [String]()
    
    if let man = try! SyncUser.current?.managementRealm() {
        
        let changes = man.objects(SyncPermissionChange.self)
        
        for permission in changes {
            
            if parseDeviceIDFromRealmPath(deviceID: deviceID, realmPath: permission.realmUrl) {
                matchingUsers.append(permission.userId)
            }
        }
    }
    
    let realm = try! Realm(configuration: configUser)
    
    if let device = realm.object(ofType: Device.self, forPrimaryKey: deviceID) {
        try! realm.write {
            device.authorizedUsers = matchingUsers.joined(separator: "/")
        }
    }
    
}

func parseDeviceIDFromRealmPath(deviceID: Int, realmPath: String?) -> Bool {
    if let openedPath = realmPath {
        var pathComponents =  openedPath.components(separatedBy: "/")
        
        if pathComponents[4] == String.init(describing: deviceID) {
            return true
        } else {
            return false
        }
        
    } else {
        return false
    }
    
}

func getPlaceConfiguration(path: String) -> Realm.Configuration {
    return Realm.Configuration(syncConfiguration: SyncConfiguration(user: SyncUser.current!, realmURL: URL(string: path)!),
                               objectTypes: [Place.self, PHY.self])
    
}


func getGroupConfiguration(path: String) -> Realm.Configuration {
    return  Realm.Configuration(syncConfiguration: SyncConfiguration(user: SyncUser.current!, realmURL: URL(string: path)!),
                                objectTypes: [Group.self])
    
}

func getUserConfiguration(user: SyncUser, path: String) -> Realm.Configuration {
    return  Realm.Configuration(syncConfiguration: SyncConfiguration(user: user, realmURL: URL(string: path)!),
                                objectTypes: [User.self,
                                              PlacePerspective.self,
                                              GroupPerspective.self,
                                              Device.self,
                                              DeviceControl.self,
                                              Vertex.self])
}




