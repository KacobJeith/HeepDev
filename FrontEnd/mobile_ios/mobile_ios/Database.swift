//
//  Database.swift
//  mobile_ios
//
//  Created by Jacob on 8/4/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import Firebase

class database {
    let interface = "both"
    
    func writeDevice(device: Device) {
        
        switch interface {
        case "both" :
            databaseRealm().writeDevice(device: device)
            databaseFirebase().writeDevice(device: device)
            
        default :
            databaseRealm().writeDevice(device: device)
        }
        
    }
    
    func updatePlaceContext(placeContext: PlacePerspective) {
        
        switch interface {
        case "firebase" :
            databaseFirebase().updatePlaceContext(placeContext: placeContext)
        case "realm" :
            databaseRealm().updatePlaceContext(placeContext: placeContext)
        default :
            databaseFirebase().updatePlaceContext(placeContext: placeContext)
        }
    }
    
    func updateDevice(device: Device) {
        switch interface {
        case "firebase" :
            databaseFirebase().writeDevice(device: device)
        case "realm" :
            databaseRealm().writeDevice(device: device)
        default :
            databaseFirebase().writeDevice(device: device)
            databaseRealm().writeDevice(device: device)
        }
    }
    
    func updateDeviceControl(control: DeviceControl) {
        switch interface {
        case "both" :
            databaseFirebase().updateDeviceControl(control: control)
            databaseRealm().updateDeviceControl(control: control)
        default :
            databaseRealm().updateDeviceControl(control: control)
        }
        
    }
    
    func updateDeviceControlList(deviceID: Int) {
        
        switch interface {
        default :
            databaseRealm().updateDeviceControlList(deviceID: deviceID)
        }
        
    }
    
    func writeVertex(vertex: Vertex) {
        switch interface {
        case "both" :
            databaseRealm().writeVertex(vertex: vertex)
            databaseFirebase().writeVertex(vertex: vertex)
            
        default :
            databaseRealm().writeVertex(vertex: vertex)
        }
        
    }
    
    func updateVertexList(tx: DeviceControl) {
        
        switch interface {
        default :
            databaseRealm().updateVertexList(tx: tx)
        }
    }
    
    func flushControlVertices(controlUniqueID: Int) {
        
        switch interface {
        case "both" :
            databaseRealm().flushControlVertices(controlUniqueID: controlUniqueID)
            databaseFirebase().flushControlVertices(controlUniqueID: controlUniqueID)
            
        default :
            databaseRealm().flushControlVertices(controlUniqueID: controlUniqueID)
        }
        
    }
    
    func deleteVertex(vertex: Vertex) {
        
        switch interface {
        case "firebase" :
            databaseFirebase().deleteVertex(vertex: vertex)
        case "realm" :
            databaseRealm().deleteVertex(vertex: vertex)
        default :
            databaseFirebase().deleteVertex(vertex: vertex)
            databaseRealm().deleteVertex(vertex: vertex)
            
        }
    }
    
    func updateDeviceNameAndIcon(device: Device, deviceName: String, iconName: String) {
        
        switch interface {
        case "both" :
            databaseFirebase().updateDeviceNameAndIcon(device: device,
                                                       deviceName: deviceName,
                                                       iconName: iconName)
            
            databaseRealm().updateDeviceNameAndIcon(device: device,
                                                    deviceName: deviceName,
                                                    iconName: iconName)
        default :
            databaseRealm().updateDeviceNameAndIcon(device: device,
                                                    deviceName: deviceName,
                                                    iconName: iconName)
        }
        
    }
    
    func createNewPlace() {
        
        switch interface {
        case "firebase" :
            databaseFirebase().createNewPlace()
        case "realm" :
            _ = databaseRealm().createNewPlace()
        default :
            let newPlace = databaseRealm().createNewPlace()
            databaseFirebase().createNewPlace(place: newPlace)
        }
    }
    
    
    
    func createNewGroup(placeID: Int) {
        
        switch interface {
        case "firebase" :
            databaseFirebase().createNewGroup(placeID: placeID)
        case "realm" :
            _ = databaseRealm().createNewGroup(placeID: placeID)
        default :
            let id = databaseRealm().createNewGroup(placeID: placeID)
            databaseFirebase().createNewGroup(placeID: placeID, groupID: id)
        }
        
    }
    
    func updateGroup(update: Group) {
        
        switch interface {
        case "firebase" :
            databaseFirebase().updateGroup(group: update)
        case "realm" :
            databaseRealm().updateGroup(update: update)
        default :
            databaseRealm().updateGroup(update: update)
            databaseFirebase().updateGroup(group: update)
        }
        
    }
    
    func updateGroupContext(update: GroupPerspective) {
        
        switch interface {
        case "firebase" :
            databaseFirebase().updateGroupContext(context: update)
        case "realm" :
            databaseRealm().updateGroupContext(update: update)
        default :
            databaseRealm().updateGroupContext(update: update)
            databaseFirebase().updateGroupContext(context: update)
        }
    }
    
    func registerNewUser(user: User, email: String, password: String) {
        
        switch interface {
        case "firebase" :
            databaseFirebase().registerNewUser(newUser: user, email: email, password: password)
        case "realm" :
            databaseRealm().registerNewUser(user: user, email: email, password: password)
        default :
            databaseRealm().registerNewUser(user: user, email: email, password: password)
            databaseFirebase().registerNewUser(newUser: user, email: email, password: password)
        }
    }
    
    func signOut() {
        
        switch interface {
        case "firebase" :
            databaseFirebase().signOut()
        case "realm" :
            databaseRealm().signOut()
        default :
            databaseFirebase().signOut()
            databaseRealm().signOut()
        }
    }
    
    
    func getPlaceContext(id: Int, completion: @escaping (PlacePerspective?) -> () ) {
        
        switch interface {
        case "realm" :
            
            completion(databaseRealm().getPlaceContext(id: id))
            
        case "firebase" :
            databaseFirebase().getPlaceContext(id: id, completion: completion)
            
        default :
            databaseFirebase().getPlaceContext(id: id, completion: completion)
            
        }
    }
    
    func getMyPlaces() -> [PlacePerspective] {
        
        switch interface {
        default :
            return databaseRealm().getMyPlaces()
        }
    }
    
    func getPlaceContexts(completion: @escaping (PlacePerspective) -> ()) {
        switch interface {
        default :
            databaseFirebase().getPlaceContexts(completion: completion)
        }
    }
    
    func watchPlaces(callback: @escaping () -> Void = {}) -> NotificationToken {
        
        switch interface {
        default :
            return databaseRealm().watchPlaces(callback: callback)
        }
    }
    
    func watchPlaces(completion: @escaping () -> ()) -> String? {
        
        switch interface {
        default :
            return databaseFirebase().watchPlaces(completion: completion)
        }
    }
    
    func getPlace(context: PlacePerspective, completion: @escaping (Place) -> () ) {
        
        switch interface {
        case "realm" :
            if let place = databaseRealm().getPlace(realmPath: context.realmPath) {
                completion(place)
            }
        default :
            databaseFirebase().getPlace(context: context, completion: completion)
        }
        
    }
    
    func getPlaceAsync(context: PlacePerspective, callback: @escaping () -> Void = {}) {
        
        switch interface {
        default :
            databaseRealm().getPlaceAsync(realmPath: context.realmPath, callback: callback)
        }
    }
    
    func getGroup(context: GroupPerspective) -> Group? {
        
        return databaseRealm().getGroup(path: context.realmPath)
        
    }
    
    func getGroup(context: GroupPerspective, completion: @escaping (Group) -> () ) {
        databaseFirebase().getGroup(context: context, completion: completion)
    }
    
    func getGroupContext(groupID: Int) -> GroupPerspective? {
        
        switch interface {
        default :
            return databaseRealm().getGroupContext(groupID: groupID)
        }
        
    }
    
    func getGroupAsync(context: GroupPerspective, callback: @escaping () -> Void = {}) {
        
        switch interface {
        default :
            databaseRealm().getGroupAsync(realmPath: context.realmPath, callback: callback)
        }
    }
    
    func watchGroup(groupID: Int, callback: @escaping () -> Void = {}) -> NotificationToken? {
        
        switch interface {
        default :
            return databaseRealm().watchGroup(groupID: groupID, callback: callback)
        }
    }
    
    func watchGroup(context: GroupPerspective, completion: @escaping (Group) -> () ) -> String {
        return databaseFirebase().watchGroup(context: context, completion: completion)
    }
    
    func watchGroupCotext(groupID: Int, callback: @escaping () -> Void = {}) -> NotificationToken? {
        
        switch interface {
        default :
            return databaseRealm().watchGroupContext(groupID: groupID, callback: callback)
        }
    }
    
    func watchVertices(callback: @escaping () -> Void = {}) -> NotificationToken? {
        
        switch interface {
        default :
            return databaseRealm().watchVertices(callback: callback)
        }
    }
    
    func watchControls(callback: @escaping () -> Void = {}) -> NotificationToken? {
        
        switch interface {
        default :
            return databaseRealm().watchControls(callback: callback)
        }
        
    }
    
    func watchDevice(deviceID: Int, callback: @escaping () -> Void = {}) -> NotificationToken? {
        
        switch interface {
        default :
            return databaseRealm().watchDevice(deviceID: deviceID, callback: callback)
        }
        
    }
    
    func watchDevices(callback: @escaping () -> Void = {}) -> NotificationToken? {
        
        switch interface {
        default :
            return databaseRealm().watchDevices(callback: callback)
        }
        
    }
    
    func getGroupContextsForPlace(placeID: Int) -> [GroupPerspective] {
        //Realm
        return databaseRealm().getGroupContextsForPlace(placeID: placeID)
        
    }
    
    func watchGroupPerspectivesForPlace(placeID: Int, reset: @escaping () -> (), completion: @escaping (GroupPerspective) -> () ) -> String? {
        
        //Firebase
        return databaseFirebase().watchGroupPerspectivesForPlace(placeID: placeID, reset: reset, completion: completion)
        
    }
    
    func getDevice(deviceID: Int) -> Device? {
        
        switch interface {
        default :
            return databaseRealm().getDevice(deviceID: deviceID)
        }
    }
    
    func getActiveDevices() -> [Device] {
        
        switch interface {
        default :
            return databaseRealm().getActiveDevices()
        }
    }
    
    func getDeviceControl(uniqueID: Int) -> DeviceControl? {
        
        switch interface {
        default :
            return databaseRealm().getDeviceControl(uniqueID: uniqueID)
        }
    }
    
    func getDeviceControlsInGroup(groupID: Int) -> [DeviceControl] {
        
        switch interface {
        default :
            return databaseRealm().getDeviceControlInGroup(groupID: groupID)
        }
    }
    
    func getVertex(vertexID: String) -> Vertex? {
        
        switch interface {
        default :
            return databaseRealm().getVertex(vertexID: vertexID)
        }
        
    }
    
    func getUserIcon(heepID: Int?, completion: @escaping () -> ()) {
        
        switch interface {
//        case "realm" :
//            completion(databaseRealm().getUserIcon(heepID: heepID))
        case "firebase" :
            databaseFirebase().getUserIcon(heepID: heepID, completion: completion)
        default :
            databaseFirebase().getUserIcon(heepID: heepID, completion: completion)
        }
    }
    
    func getMyHeepID() -> Int? {
        
        //Realm
        return databaseRealm().getMyHeepID()
        
    }
    
    func getMyHeepID(completion: @escaping (Int?) -> ()) {
        
        databaseFirebase().getMyHeepID(completion: completion)
        
    }
    
    func getUserHeepID(realmKey: String) -> Int? {
        
        switch interface {
        case "realm" :
            return databaseRealm().getUserHeepID(realmKey: realmKey)
        default :
            return databaseRealm().getUserHeepID(realmKey: realmKey)
        }
    }
    
    func getAllUsers() -> [User] {
        switch interface {
        default :
            return databaseRealm().getAllUsers()
        }
    }
    
    func getUserProfile(heepID: Int) -> User? {
        
        switch interface {
        default :
            return databaseRealm().getUserProfile(heepID: heepID)
        }
        
    }
    
    func resetActiveDevices() {
        
        switch interface {
        default :
            return databaseRealm().resetActiveDevices()
        }
        
    }
    
    func loginUser(email: String, password: String, callback: @escaping () -> Void = {}) {
        
        switch interface {
        case "firebase" :
            databaseFirebase().loginUser(email: email, password: password, callback: callback)
        case "realm" :
            databaseRealm().loginUser(email: email, password: password, callback: callback)
        default :
            databaseRealm().loginUser(email: email, password: password, callback: callback)
            databaseFirebase().loginUser(email: email, password: password, callback: callback)
        }
    }
    
    func updateDeviceUserList(deviceID: Int) {
        
        switch interface {
        default :
            databaseRealm().retrieveDeviceUsers(deviceID: deviceID)
        }
    }
    
    func checkForPermissionUpdates() {
        
        switch interface {
        default :
            databaseRealm().checkForNewRealmPermissions()
        }
    }
    
    func initializeApp() {
        switch interface {
        default:
            databaseRealm().initializeApp()
        }
    }
    
    func assignDeviceAdmin(deviceID: Int) {
        
        switch interface {
        default :
            databaseRealm().createDeviceRealm(deviceID: deviceID)
        }
    }
    
    func grantUserAccessToDevice(deviceID: Int, userID: Int) {
        
        switch interface {
        default :
            databaseRealm().grantPermissionToOtherUser(deviceID: deviceID, userID: userID)
        }
        
    }
    
    func checkIfLoggedIn() -> Int {
        switch interface {
        default :
            return databaseRealm().checkIfLoggedIn()
        }
    }
    
    func detachObserver(referencePath: String) {
        
        databaseFirebase().detachObserver(referencePath: referencePath)
    }
    
    
    
}
