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
    let urlString = digitalOceanRealm + "/~/device/" + String(deviceID)
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
    
    let urlString = digitalOceanRealm + "/~/place/" + String(placeID)
    
    let realmPlace = try! Realm(configuration: getPlaceConfiguration(path: urlString))
    let realmUser = try! Realm(configuration: configUser)
    
    let newPlace = Place()
    newPlace.name = "New Place"
    newPlace.placeID = placeID
    
    let newPlacePerspective = PlacePerspective()
    newPlacePerspective.placeID = placeID
    newPlacePerspective.realmPath = urlString
    
    try! realmPlace.write {
        realmPlace.add(newPlace, update: true)
    }
    
    try! realmUser.write {
        realmUser.add(newPlacePerspective, update: true)
    }
    
    print(newPlace)
    
    return newPlace
}

func createGroupRealm(placeID: Int) {
    let groupID = randomNumber(inRange: 0...4000000000)
    let urlString = digitalOceanRealm + "/~/group/" + String(groupID)
    
    let realmGroup = try! Realm(configuration: getGroupConfiguration(path: urlString))
    let realmUser = try! Realm(configuration: configUser)
    
    let newGroup = Group()
    newGroup.groupID = groupID
    newGroup.placeID = placeID
    
    let newGroupPerspective = GroupPerspective()
    newGroupPerspective.groupID = groupID
    newGroupPerspective.placeID = placeID
    newGroupPerspective.realmPath = urlString
    
    try! realmGroup.write {
        realmGroup.add(newGroup, update: true)
    }
    
    try! realmUser.write {
        realmUser.add(newGroupPerspective, update: true)
    }
    
}


func grantPermissionToOtherUser(deviceID: Int, userID: Int) {
    let realmPublic = try! Realm(configuration: configPublicSync)
    
    guard let userToGrant = realmPublic.object(ofType: User.self, forPrimaryKey: userID)?.realmKey else {
        print("Could not find the realm path for this user. Exiting Grant.")
        return
    }
    
    let permission = SyncPermissionValue(realmPath: "/~/device/" + String(deviceID),
                                         userID: userToGrant,
                                         accessLevel: .write)
    
    SyncUser.current?.applyPermission(permission) { error in
        
        if let error = error {
            print("PERMISSION UNSUCCESSFUL \(error)")
            return
        }
        
        print("Successfully added permission to new user")
        
        addNewUserToAuthorizedList(deviceID: deviceID, newUser: userToGrant)
        grantDeviceContextAccessToNewUser(deviceID: deviceID, newUser: userToGrant)
        
        return
    }
}

func addNewUserToAuthorizedList(deviceID: Int, newUser: String) {
    let realm = try! Realm(configuration: configUser)
    
    guard let device = realm.object(ofType: Device.self, forPrimaryKey: deviceID) else {
        print("Could not retrieve device")
        return
    }
    
    let newUserList = device.authorizedUsers + "/" + newUser
    print("previously...\(device.authorizedUsers)")
    print("authorized \(newUserList)")
    
    try! realm.write {
        device.authorizedUsers = newUserList
    }
}

func grantDeviceContextAccessToNewUser(deviceID: Int, newUser: String) {
    let realm = try! Realm(configuration: configUser)
    
    guard let device = realm.object(ofType: Device.self, forPrimaryKey: deviceID) else {
        print("Could not retrieve the device")
        return
    }
    
    for control in device.controlList {
        grantGroupAccessToNewUser(groupID: control.groupID, newUser: newUser)
    }
}

func grantGroupAccessToNewUser(groupID: Int, newUser: String) {
    let realmUser = try! Realm(configuration: configUser)
    
    guard let group = realmUser.object(ofType: GroupPerspective.self, forPrimaryKey: groupID) else {
        print("Could not find group")
        return
    }
    
    let permission = SyncPermissionValue(realmPath: extractRelativeRealmPath(realmPath: group.realmPath),
                                         userID: newUser,
                                         accessLevel: .admin)
    
    SyncUser.current?.applyPermission(permission) { error in
        if let error = error {
            print("Group Permission Error: \(error)")
            return
        }
        
        print("Successfully added group permission to new user")
        return
    }
    
    grantPlaceAccessToNewUser(placeID: group.placeID, newUser: newUser)
    
}

func grantPlaceAccessToNewUser(placeID: Int, newUser: String) {
    let realmUser = try! Realm(configuration: configUser)
    
    guard let place = realmUser.object(ofType: PlacePerspective.self, forPrimaryKey: placeID) else {
        print("Could not find place perspective")
        return
    }
    
    let permission = SyncPermissionValue(realmPath: extractRelativeRealmPath(realmPath: place.realmPath),
                                         userID: newUser,
                                         accessLevel: .admin)
    
    SyncUser.current?.applyPermission(permission) { error in
        if let error = error {
            print("Place Permission Error: \(error)")
            return
        }
        
        print("Successfully added place permission to new user")
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
        
        if pathComponents[5] == String.init(describing: deviceID) {
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

func extractRelativeRealmPath(realmPath: String) -> String {
    let separatedPath = realmPath.components(separatedBy: "/")
    let count = separatedPath.count
    
    return "/" + separatedPath[count-3...count-1].joined(separator: "/")
    
    
}



