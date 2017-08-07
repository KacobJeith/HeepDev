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
    let digitalOceanIP = "45.55.249.217:9080"
    let publicUserKey = "3236896a34becbac18c96a9a24c55de9"
    let digitalOceanHTTP = "http://" + digitalOceanIP
    let digitalOceanRealm = "realm://" + digitalOceanIP
    let digitalOceamUserRealm = digitalOceanRealm + "/~/heepzone"
    let dititalOceanPublicRealm = digitalOceanRealm + "/" + publicUserKey + "/userDirectory"
    
    var configGuest = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    var configUser = configGuest
    var configPublicSync =  Realm.Configuration(syncConfiguration: SyncConfiguration(user: SyncUser.current!,
                                                                                     realmURL: URL(string: dititalOceanPublicRealm)!),
                                                objectTypes: [User.self])

    
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
    
    
    func loginUser(email: String, password: String, callback: @escaping () -> Void = {}) {
        
        let url = URL(string: digitalOceanHTTP)!
        
        let credentials = SyncCredentials.usernamePassword(username: email,
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
                
                if parseIDFromRealmPath(id: deviceID, realmPath: permission.realmUrl) {
                    matchingUsers.append(permission.userId)
                }
            }
        }
        
        let uniqueUsers = Array(Set(matchingUsers))
        
        if let device = realm.object(ofType: Device.self, forPrimaryKey: deviceID) {
            try! realm.write {
                device.authorizedUsers = uniqueUsers.joined(separator: "/")
            }
        }
        
    }
    
    func parseIDFromRealmPath(id: Int, realmPath: String?) -> Bool {
        if let openedPath = realmPath {
            var pathComponents =  openedPath.components(separatedBy: "/")
            
            if pathComponents[5] == String.init(describing: id) {
                return true
            } else {
                return false
            }
            
        } else {
            return false
        }
    }
    
    func parseTypeFromRealmPath(type: String, realmPath: String?) -> Bool {
        if let openedPath = realmPath {
            var pathComponents =  openedPath.components(separatedBy: "/")
            
            if pathComponents[2] == String.init(describing: type) {
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
    
    func checkForNewRealmPermissions() {
        var allPlaces = [String]()
        var allGroups = [String]()
        
        SyncUser.current?.retrievePermissions { permissions, error in
            
            guard let allRealms = permissions else  {
                print("No permissions")
                return
            }
            print(allRealms)
            
            for permission in allRealms {
                
                if parseTypeFromRealmPath(type: "place", realmPath: permission.path) {
                    allPlaces.append(permission.path)
                    
                } else if parseTypeFromRealmPath(type: "group", realmPath: permission.path) {
                    allGroups.append(permission.path)
                }
            }
            
            let uniquePlaces = Array(Set(allPlaces))
            let uniqueGroups = Array(Set(allGroups))
            
            self.findNewPlaces(places: uniquePlaces)
            self.findNewGroups(groups: uniqueGroups)
        }
    }
    
    func findNewPlaces(places: [String]) {
        
        let realm = try! Realm(configuration: configUser)
        
        for placePath in places {
            let fullPlacePath = digitalOceanRealm + placePath
            let realmPlace = try! Realm(configuration: getPlaceConfiguration(path: fullPlacePath))
            
            if let placeID = realmPlace.objects(Place.self).first?.placeID {
                if realm.object(ofType: PlacePerspective.self, forPrimaryKey: placeID) == nil {
                    createNewPlace(placeID: placeID, realmPath: fullPlacePath)
                }
            } else {
                print("COULDNT RETRIEVE PLACEID")
            }
        }
    }
    
    func findNewGroups(groups: [String]) {
        
        let realm = try! Realm(configuration: configUser)
        
        for groupPath in groups {
            let fullGroupPath = digitalOceanRealm + groupPath
            let realmGroup = try! Realm(configuration: getGroupConfiguration(path: fullGroupPath))
            
            if let thisGroup = realmGroup.objects(Group.self).first {
                if realm.object(ofType: GroupPerspective.self, forPrimaryKey: thisGroup.groupID) == nil {
                    createNewGroup(groupID: thisGroup.groupID, realmPath: fullGroupPath, placeID: thisGroup.placeID)
                }
            } else {
                print("COULDNT RETRIEVE GROUPID")
            }
        }
    }
    
    func createNewPlace(placeID: Int, realmPath: String) {
        DispatchQueue.global().async {
            let realm = try! Realm(configuration: configUser)
            
            let newPlacePerspective = PlacePerspective()
            newPlacePerspective.placeID = placeID
            newPlacePerspective.realmPath = realmPath
            
            try! realm.write {
                realm.add(newPlacePerspective, update: true)
            }
            
        }
    }
    
    func createNewGroup(groupID: Int, realmPath: String, placeID: Int) {
        DispatchQueue.global().async {
            let realm = try! Realm(configuration: configUser)
            
            let newGroupPerspective = GroupPerspective()
            newGroupPerspective.groupID = groupID
            newGroupPerspective.placeID = placeID
            newGroupPerspective.realmPath = realmPath
            
            try! realm.write {
                realm.add(newGroupPerspective, update: true)
            }
            
        }
    }


    
}
