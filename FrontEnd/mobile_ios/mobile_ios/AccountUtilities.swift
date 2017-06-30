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
    
    if SyncUser.current == nil {
        
        print("Logging out")
        logoutOfAllRealmUsers()
        configUser = configGuest
        
    } else {
        configUser = Realm.Configuration(syncConfiguration: SyncConfiguration(user: SyncUser.current!, realmURL: URL(string: "realm://45.55.249.217:9080/~/heepzone")!))
    }
    
    //loginToPublicRealm()
    
}

func logoutOfAllRealmUsers() {
    for user in SyncUser.all {
        debugPrint("user: \(user.key) - \(user.value)")
        user.value.logOut()
    }
}

func seedNewUserAccount(name: String,
                        imageURL: String = "https://lorempixel.com/400/400/cats/",
                        id: String,
                        email: String = "",
                        password: String = "",
                        callback: @escaping () -> Void = {}) {
    
    
    let newUser = User()
    
    newUser.heepID = randomNumber(inRange: 1...1000000)
    newUser.name = name
    newUser.iconURL = imageURL
    newUser.email = email
    newUser.icon = getUserIcon(iconURL: newUser.iconURL)
    
    registerNewSyncRealm(username: email, password: password, callback: callback, newUser: newUser)
    
}

func registerNewSyncRealm(username: String, password: String, callback: @escaping () -> Void = {}, newUser: User = User()) {
    let url = URL(string: "http://45.55.249.217:9080")!
    let userURL = URL(string: "realm://45.55.249.217:9080/~/heepzone")!
    
    let registerCredentials =  SyncCredentials.usernamePassword(username: username, password: password, register: true)
    
    SyncUser.logIn(with: registerCredentials,
                   server: url,
                   onCompletion: { user, error in
                    
                    if user == nil {
                        print("ERROR: \(String(describing: error))")
                        return
                    }
                        
                    configUser =  Realm.Configuration(syncConfiguration: SyncConfiguration(user: user!, realmURL: userURL))
                    addNewUserToUserRealm(newUser: newUser)
                    addNewUserToPublicRealm(newUser: newUser)

    })
      
}


func loginToUserRealmSync(username: String, password: String, callback: @escaping () -> Void = {}) {
    
    let url = URL(string: "http://45.55.249.217:9080")!
    let userURL = URL(string: "realm://45.55.249.217:9080/~/heepzone")!
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
                        
                        configUser =  Realm.Configuration(syncConfiguration: SyncConfiguration(user: user!,
                                                                                               realmURL: userURL))
                        
                        print("Found existing")
                        callback()
                    }
                    
    })
    
}

func queryAllUser() {
    let realm = try! Realm(configuration: configPublicSync)
    let allUsers = realm.objects(User.self)
    print("Configuration: \(String(describing: configPublicSync.syncConfiguration))")
    print("All Users: \(allUsers)")
    
}

func setDefaultPermissionToPublic(publicUser: SyncUser) {
    let permission = SyncPermissionValue(realmPath: "/3236896a34becbac18c96a9a24c55de9/userDirectory",
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

func addNewUserToPublicRealm(newUser: User) {
    let realm = try! Realm(configuration: configPublicSync)
    
    try! realm.write {
        realm.add(newUser,
                  update: true)
    }
    
    print("ADDED NEW USER TO PUBLIC REALM")
    let allUsers = realm.objects(User.self)
    
    print("All Users: \(allUsers)")
    
}

func addNewUserToUserRealm(newUser: User) {
    let realm = try! Realm(configuration: configUser)
    
    try! realm.write {
        realm.create(User.self,
                     value: ["heepID": newUser.heepID],
                     update: true)
    }
    
}

