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


func grantPermissionToOtherUser(deviceID: Int, userID: Int) {
    let realmPublic = try! Realm(configuration: configPublicSync)
    let userToGrant = realmPublic.object(ofType: User.self, forPrimaryKey: userID)
    
    let permission = SyncPermissionValue(realmPath: "/~/" + String(deviceID),
                                         userID: (userToGrant?.realmKey)!,
                                         accessLevel: .write)
    
    SyncUser.current?.applyPermission(permission) { error in
        print("Successfully added permission to new user")
        
        if let error = error {
            // handle error
            print("PERMISSION UNSUCCESSFUL \(error)")
            return
        }
    }
}

func retrieveDeviceUsers(deviceID: Int) {
    var matchingUsers = [String]()
    
    SyncUser.current?.retrievePermissions { permissions, error in
        
        if error != nil {
            // handle error
            
            return
        }
        
        // success! access permissions
        if let permissionList = permissions {
            
            print(permissionList)
            
            for permission in permissionList {
                
                if parseDeviceIDFromRealmPath(deviceID: deviceID, realmPath: permission.path) {
                    print("FOUND ONE: \(String(describing: permission.userId))")
                    matchingUsers.append((permission.userId)!)
                } else {
                    print("DOES NOT MATCH")
                }
            }
            
            let realm = try! Realm(configuration: configUser)
            
            if let device = realm.object(ofType: Device.self, forPrimaryKey: deviceID) {
                try! realm.write {
                    device.authorizedUsers = matchingUsers.joined(separator: "/")
                }
            }
            
        }
        return
    }
    
}

func parseDeviceIDFromRealmPath(deviceID: Int, realmPath: String?) -> Bool {
    if let openedPath = realmPath {
        var pathComponents =  openedPath.components(separatedBy: "/")
        //print(pathComponents)
        //print("DEVICE: \(String.init(describing: deviceID)), PATH: \(pathComponents[1])")
        if pathComponents[2] == String.init(describing: deviceID) {
            return true
        } else {
            return false
        }
        
    } else {
        return false
    }
    
}




