//
//  Database_Realm.swift
//  mobile_ios
//
//  Created by Jacob on 8/4/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class databaseRealm {
    let realm = try! Realm(configuration: configUser)
    
    func getDevice(deviceID: Int) -> Device? {
        return realm.object(ofType: Device.self, forPrimaryKey: deviceID)
    
    }
    
    func writeDevice(device: Device) {
        
        try! realm.write {
            realm.add(device, update: true)
        }
        
    }
    
    func getDeviceControl(uniqueID: Int) -> DeviceControl? {
        
        return realm.object(ofType: DeviceControl.self, forPrimaryKey: uniqueID)
        
    }
    
    func updateDeviceControl(control: DeviceControl) {
        
        try! realm.write {
            
            realm.add(control, update: true)
            
        }
    }
    
    func updateDeviceControlList(deviceID: Int) {
        
        let thisDevicesControls = realm.objects(DeviceControl.self).filter("deviceID == %d", deviceID)
        
        try! realm.write {
            realm.create(Device.self,
                         value: ["deviceID": deviceID,
                                 "controlList": thisDevicesControls],
                         update: true)
        }
    }
    
    func getVertex(vertexID: String) -> Vertex? {
        return realm.object(ofType: Vertex.self, forPrimaryKey: vertexID)
    }
    
    func writeVertex(vertex: Vertex) {
        
        try! realm.write {
            
            realm.add(vertex, update: true)
        }
    }
    
    func updateVertexList(tx: DeviceControl) {
        
        let txVertices = realm.objects(Vertex.self).filter("tx == %@", tx)
        
        try! realm.write {
            
            realm.create(DeviceControl.self,
                         value: ["uniqueID": tx.uniqueID,
                                 "vertexList": txVertices],
                         update: true)
        }
    }
    
    func flushControlVertices(controlUniqueID: Int) {
        
        guard let thisControl = realm.object(ofType: DeviceControl.self, forPrimaryKey: controlUniqueID) else {
            print("could not find this control")
            return
        }
        
        try! realm.write {
            
            realm.delete(thisControl.vertexList)
        }
        
    }
    
    func updateDeviceNameAndIcon(device: Device, deviceName: String, iconName: String) {
        
        try! realm.write {
            device.name = deviceName
            device.iconName = iconName
            
        }
    }
    
    func addNotificationBlock() {
        
    }
    
    func createNewPlace() -> Int {
        
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
        
        return placeID
    }
    
    func registerNewUser(user: User,
                        email: String = "",
                        password: String = "",
                        repair: Bool = false,
                        callback: @escaping () -> Void = {}) {
        
        
        if repair {
            addNewUserToPublicRealm(newUser: user, callback: callback)
        } else {
            registerNewSyncRealm(username: email, password: password, newUser: user, callback: callback )
            
        }
        
    }
    
    func signOut() {
        for user in SyncUser.all {
            debugPrint("user: \(user.key) - \(user.value)")
            user.value.logOut()
        }
    }
    
    func getMyPlaces() -> [PlacePerspective] {
        return realm.objects(PlacePerspective.self).toArray()
    }
    
    func getPlace(realmPath: String) -> Place? {
        let thisPlaceRealm = try! Realm(configuration: getPlaceConfiguration(path: realmPath))
        
        return thisPlaceRealm.objects(Place.self).first         
    }
    
    func getPlaceAsync(realmPath: String, callback: @escaping () -> Void = {}) {
        
       openRealmAsync(config: getPlaceConfiguration(path: realmPath), callback: callback)
    
    }
    
    func getGroup(path: String) -> Group? {
        let thisGroupRealm = try! Realm(configuration: getGroupConfiguration(path: path))
        
        return thisGroupRealm.objects(Group.self).first
        
    }
    
    func getGroupAsync(realmPath: String, callback: @escaping () -> Void = {}) {
        
        openRealmAsync(config: getGroupConfiguration(path: realmPath), callback: callback)
        
    }
    
    func getGroupContextsForPlace(placeID: Int) -> [GroupPerspective] {
        
        return realm.objects(GroupPerspective.self).filter("placeID = %@", placeID).toArray()
    }
    
    func getPlaceContext(id: Int) -> PlacePerspective? {
        
        return realm.object(ofType: PlacePerspective.self, forPrimaryKey: id)
        
    }
    
    func updatePlaceContext(placeContext: PlacePerspective) {
        
        try! realm.write{
            realm.add(placeContext, update: true)
        }
        
    }
    
    func getUserIcon(heepID: Int?) -> UIImage {
        
        var userImage = #imageLiteral(resourceName: "female")
        
        if heepID != nil {
            
            userImage = myImage(userID: heepID!)
        }
        
        return userImage
    }
    
    func getMyHeepID() -> Int? {
        return realm.objects(User.self).first?.heepID
    }
    
    func watchPlaces(callback: @escaping () -> Void = {}) -> NotificationToken {
        
        return realm.objects(PlacePerspective.self).addNotificationBlock { [weak self] (changes: RealmCollectionChange) in
            
            switch changes {
            case .update:
                
                callback()
                
                break
                
            case .error(let error):
                
                fatalError("\(error)")
                break
                
            default: break
            }
        }
        
    }
    
    
}
