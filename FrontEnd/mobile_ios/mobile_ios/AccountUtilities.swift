//
//  AccountUtilities.swift
//  mobile_ios
//
//  Created by Jacob on 6/28/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import Foundation
import RealmSwift

func initializeApp() {
    print("Initializing")
    SyncManager.shared.logLevel = .off
    
    if SyncUser.all.count == 0 {
        
        print("Logging out")
        logoutOfAllRealmUsers()
        configUser = configGuest
        
    } else if SyncUser.all.first?.key == publicUserKey {
        
        print("Logging out")
        logoutOfAllRealmUsers()
        configUser = configGuest
        
    } else {
        
        configUser =  getUserConfiguration(user: SyncUser.current!, path: digitalOceamUserRealm)
        
    }
    
}

func logoutOfAllRealmUsers() {
    for user in SyncUser.all {
        debugPrint("user: \(user.key) - \(user.value)")
        user.value.logOut()
    }
}

func seedNewUserAccount(name: String = "Jacob Keith",
                        imageURL: String = "https://lorempixel.com/400/400/",
                        heepID: Int = randomNumber(inRange: 1...1000000),
                        email: String = "",
                        password: String = "",
                        repair: Bool = false,
                        callback: @escaping () -> Void = {}) {
    
    
    let newUser = User()
    
    newUser.heepID = heepID
    newUser.name = name
    newUser.iconURL = imageURL
    newUser.email = email
    newUser.icon = getUserIcon(iconURL: newUser.iconURL)
    
    if repair {
        addNewUserToPublicRealm(newUser: newUser, callback: callback)
    } else {
        registerNewSyncRealm(username: email, password: password, newUser: newUser, callback: callback)
        
    }
    
}

func registerNewSyncRealm(username: String, password: String, newUser: User = User(), callback: @escaping () -> Void = {}) {
    let url = URL(string: digitalOceanHTTP)!
    
    let registerCredentials =  SyncCredentials.usernamePassword(username: username, password: password, register: true)
    
    SyncUser.logIn(with: registerCredentials,
                   server: url,
                   onCompletion: { user, error in
                    
                    if let userUnwrapped = user {
                        
                        setNewPublicSyncUser(newUser: userUnwrapped)
                            
                        configUser =  getUserConfiguration(user: userUnwrapped, path: digitalOceamUserRealm)
                        
                        addNewUserToUserRealm(newUser: newUser)
                        
                        if let identity = userUnwrapped.identity {
                            print("NOT NIL: \(identity)")
                            newUser.realmKey = identity
                            addNewUserToPublicRealm(newUser: newUser)
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
                        openRealmAsync(config: configUser)
                        openRealmAsync(config: configPublicSync)
                        
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
                        addNewUserToPublicRealm(newUser: firstUser)
                        print("Found existing: \(String(describing: user))")
                        setDefaultPermissionToPublic(publicUser: user!)
                        
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





