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
    
    func getActiveDevices() -> [Device] {
        
        return realm.objects(Device.self).filter("active = %@", true).toArray()
        
    }
    
    func getDeviceControl(uniqueID: Int) -> DeviceControl? {
        
        return realm.object(ofType: DeviceControl.self, forPrimaryKey: uniqueID)
        
    }
    
    func getDeviceControlInGroup(groupID: Int) -> [DeviceControl] {
        return realm.objects(DeviceControl.self).filter("groupID = %@", groupID).toArray()
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
    
    func deleteVertex(vertex: Vertex) {
        
        try! realm.write {
            realm.delete(vertex)
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
    
    func createNewGroup(placeID: Int) -> Int {
        
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
        
        return groupID
    }

    func updateGroup(update: Group) {
        guard let context = realm.object(ofType: GroupPerspective.self, forPrimaryKey: update.groupID) else {
            print("Failed to find realm path")
            return
        }
        
        let groupRealm = try! Realm(configuration: getGroupConfiguration(path: context.realmPath))
        
        try! groupRealm.write {
            groupRealm.add(update, update: true)
        }
        
    }
    
    func updateGroupContext(update: GroupPerspective) {
        
        try! realm.write {
            realm.add(update, update: true)
        }
        
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
    
    func watchGroup(groupID: Int, callback: @escaping () -> Void = {}) -> NotificationToken? {
        guard let context = getGroupContext(groupID: groupID) else {
            print("Couldn't find context for group")
            return nil
        }
        
        guard let group = getGroup(path: context.realmPath) else {
            print("Couldn't grab group")
            return nil
        }
        
        return group.addNotificationBlock { changes in
            
            switch changes {
            case .change:
                
                callback()
                
                break
                
            case .error(let error):
                
                fatalError("\(error)")
                break
                
            default: break
            }
        }
    }
    
    func getGroupContext(groupID: Int) -> GroupPerspective? {
        return realm.object(ofType: GroupPerspective.self, forPrimaryKey: groupID)
    }
    
    func watchGroupContext(groupID: Int, callback: @escaping () -> Void = {}) -> NotificationToken? {
        guard let context = getGroupContext(groupID: groupID) else {
            print("Couldn't find context for group")
            return nil
        }
        
        return context.addNotificationBlock { changes in
            
            switch changes {
            case .change:
                
                callback()
                
                break
                
            case .error(let error):
                
                fatalError("\(error)")
                break
                
            default: break
            }
        }
    }
    
    func watchVertices(callback: @escaping () -> Void = {}) -> NotificationToken? {
        
        return realm.objects(Vertex.self).addNotificationBlock {  [weak self] (changes: RealmCollectionChange) in
            
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
    
    func watchControls(callback: @escaping () -> Void = {}) -> NotificationToken? {
        
        return realm.objects(DeviceControl.self).addNotificationBlock {  [weak self] (changes: RealmCollectionChange) in
            
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
    
    func watchDevice(deviceID: Int, callback: @escaping () -> Void = {}) -> NotificationToken? {
        
        if let watchThisDevice = realm.object(ofType: Device.self, forPrimaryKey: deviceID) {
            
            return watchThisDevice.addNotificationBlock {  changes in
                
                switch changes {
                case .change:
                    
                    callback()
                    
                    break
                case .error(let error):
                    fatalError("\(error)")
                    break
                default: break
                }
            }
        } else {
            print("REALM WATCHING FAILED")
            return nil
        }
        
    }
    
    func watchDevices(callback: @escaping () -> Void = {}) -> NotificationToken? {
    
        return realm.objects(Device.self).addNotificationBlock { changes in
            
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
    
    func getUserHeepID(realmKey: String) -> Int? {
        
        return try! Realm(configuration: configPublicSync).objects(User.self).filter("realmKey = %@", realmKey).first?.heepID
        
    }
    
    func getAllUsers() -> [User] {
        
        return try! Realm(configuration: configPublicSync).objects(User.self).toArray()
    }
    
    func getUserProfile(heepID: Int) -> User? {
        
        return try! Realm(configuration: configPublicSync).object(ofType: User.self, forPrimaryKey: heepID)
            
    }
    
    func resetActiveDevices() {
        
        let devices = realm.objects(Device.self)
        
        try! realm.write {
            devices.setValue(false, forKey: "active")
        }
        
    }
    
    func initializeApp() {
        print("Initializing")
        SyncManager.shared.logLevel = .off
        
        if SyncUser.all.count == 0 {
            
            print("Logging out")
            database().signOut()
            
            configUser = configGuest
            
        } else if SyncUser.all.first?.key == publicUserKey {
            
            print("Logging out")
            database().signOut()
            
            configUser = configGuest
            
        } else {
            
            configUser =  getUserConfiguration(user: SyncUser.current!, path: digitalOceamUserRealm)
            
        }
        
    }
    
    func registerNewSyncRealm(username: String, password: String, newUser: User = User(), callback: @escaping () -> Void = {}) {
        let url = URL(string: digitalOceanHTTP)!
        
        
        let registerCredentials =  SyncCredentials.usernamePassword(username: username, password: password, register: true)
        
        SyncUser.logIn(with: registerCredentials,
                       server: url,
                       onCompletion: { user, error in
                        
                        if let userUnwrapped = user {
                            
                            self.setNewPublicSyncUser(newUser: userUnwrapped)
                            
                            configUser =  getUserConfiguration(user: userUnwrapped, path: digitalOceamUserRealm)
                            
                            self.addNewUserToUserRealm(newUser: newUser)
                            
                            if let identity = userUnwrapped.identity {
                                print("NOT NIL: \(identity)")
                                newUser.realmKey = identity
                                self.addNewUserToPublicRealm(newUser: newUser)
                            } else {
                                print("NEW REALM RETURNED NIL")
                            }
                            
                        } else {
                            print("ERROR: \(String(describing: error))")
                            return
                        }
                        
        })
        
    }
    
    
    func loginToUserRealmSync(username: String, password: String, callback: @escaping () -> Void = {}) {
        
        let url = URL(string: digitalOceanHTTP)!
        
        let credentials = SyncCredentials.usernamePassword(username: username,
                                                           password: password,
                                                           register: false)
        
        SyncUser.logIn(with: credentials,
                       server: url,
                       onCompletion: { user, error in
                        if user == nil {
                            print("No User Account Found")
                            callback()
                        } else {
                            
                            configUser =  getUserConfiguration(user: user!, path: digitalOceamUserRealm)
                            
                            checkForNewRealmPermissions()
                            self.openRealmAsync(config: configUser)
                            self.openRealmAsync(config: configPublicSync)
                            
                            callback()
                        }
                        
        })
        
    }
    
    func openRealmAsync(config: Realm.Configuration, callback: @escaping () -> Void = {}) {
        Realm.asyncOpen(configuration: config) { realm, error in
            if let realm = realm {
                // Realm successfully opened, with migration applied on background thread
                print("REALM OPEN: \(realm)")
                callback()
            } else if let error = error {
                // Handle error that occurred while opening the Realm
                print(error)
            }
        }
    }
    
    func setDefaultPermissionToPublic(publicUser: SyncUser) {
        let permission = SyncPermissionValue(realmPath: "/" + publicUserKey + "/userDirectory",
                                             userID: "*",
                                             accessLevel: .write)
        
        print("TRYING PERMISSION")
        publicUser.applyPermission(permission) { error in
            print("ENTER?")
            if let error = error {
                // handle error
                print("PERMISSION UNSUCCESSFUL \(error)")
                return
            }
        }
    }
    
    func loginToPublicRealm() {
        let url = URL(string: digitalOceanHTTP)!
        
        let credentials = SyncCredentials.usernamePassword(username: "public@heep.io",
                                                           password: "public",
                                                           register: false)
        
        SyncUser.logIn(with: credentials,
                       server: url,
                       onCompletion: { user, error in
                        if user == nil {
                            print("No User Account Found")
                            
                        } else {
                            
                            let firstUser = User()
                            self.addNewUserToPublicRealm(newUser: firstUser)
                            print("Found existing: \(String(describing: user))")
                            self.setDefaultPermissionToPublic(publicUser: user!)
                            
                        }
                        
        })
    }
    
    func addNewUserToPublicRealm(newUser: User, callback: @escaping () -> Void = {}) {
        let realm = try! Realm(configuration: configPublicSync)
        
        try! realm.write {
            realm.add(newUser,
                      update: true)
        }
        
        print("ADDED NEW USER TO PUBLIC REALM")
        let allUsers = realm.objects(User.self)
        
        print("All Users: \(allUsers)")
        callback()
        
    }
    
    func addNewUserToUserRealm(newUser: User) {
        let realm = try! Realm(configuration: configUser)
        
        try! realm.write {
            realm.create(User.self,
                         value: ["heepID": newUser.heepID],
                         update: true)
        }
        
    }
    
    func setNewPublicSyncUser(newUser: SyncUser) {
        configPublicSync =  Realm.Configuration(syncConfiguration: SyncConfiguration(user: newUser,
                                                                                     realmURL: URL(string: dititalOceanPublicRealm)!),
                                                objectTypes: [User.self])
        
    }

    
}
