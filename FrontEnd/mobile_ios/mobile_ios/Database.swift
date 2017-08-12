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
        case "firebase" :
            databaseFirebase().writeDevice(device: device)
            
        case "realm" :
            databaseRealm().writeDevice(device: device)
        default :
            databaseFirebase().writeDevice(device: device)
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
//            databaseRealm().writeDevice(device: device)
        }
    }
    
    func updateDeviceControl(control: DeviceControl) {
        switch interface {
        case "firebase" :
            databaseFirebase().updateDeviceControl(control: control)
        case "realm" :
            databaseRealm().updateDeviceControl(control: control)
        default :
            databaseFirebase().updateDeviceControl(control: control)
        }
        
    }
    
    func writeDeviceControl(control: DeviceControl) {
        
        databaseFirebase().writeDeviceControl(control: control)
        //databaseRealm().updateDeviceControl(control: control)
    }
    
    func updateDeviceControlList(deviceID: Int) {
        
//        switch interface {
//        default :
//            databaseRealm().updateDeviceControlList(deviceID: deviceID)
//        }
        
    }
    
    func writeVertex(vertex: Vertex) {
        switch interface {
        case "realm" :
            databaseRealm().writeVertex(vertex: vertex)
        case "firebase" :
            databaseFirebase().writeVertex(vertex: vertex)
        default :
            databaseFirebase().writeVertex(vertex: vertex)
        }
        
    }
    
    func updateVertexList(tx: DeviceControl) {
//        
//        switch interface {
//        default :
//            databaseRealm().updateVertexList(tx: tx)
//        }
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
        print("DECIDING")
        
        switch interface {
        case "firebase" :
            databaseFirebase().deleteVertex(vertex: vertex)
        case "realm" :
            databaseRealm().deleteVertex(vertex: vertex)
        default :
            databaseFirebase().deleteVertex(vertex: vertex)
            //databaseRealm().deleteVertex(vertex: vertex)
            
        }
    }
    
    func updateDeviceNameAndIcon(device: Device, deviceName: String, iconName: String) {
        
        switch interface {
        case "firebase" :
            databaseFirebase().updateDeviceNameAndIcon(device: device,
                                                       deviceName: deviceName,
                                                       iconName: iconName)
        case "realm" :
            
            databaseRealm().updateDeviceNameAndIcon(device: device,
                                                    deviceName: deviceName,
                                                    iconName: iconName)
        default :
            databaseFirebase().updateDeviceNameAndIcon(device: device,
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
            databaseFirebase().createNewGroup(placeID: placeID)
        }
    }
    
    func updateGroup(update: Group) {
        
        switch interface {
        case "firebase" :
            databaseFirebase().updateGroup(group: update)
        case "realm" :
            databaseRealm().updateGroup(update: update)
        default :
//            databaseRealm().updateGroup(update: update)
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
//            databaseRealm().updateGroupContext(update: update)
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
    
    func getGroup(context: GroupPerspective, completion: @escaping (Group) -> () ) {
        databaseFirebase().getGroup(context: context, completion: completion)
    }
    

    func watchGroup(context: GroupPerspective, completion: @escaping (Group) -> () ) -> String {
        return databaseFirebase().watchGroup(context: context, completion: completion)
    }
    
    func watchGroupContext(groupID: Int, completion: @escaping (GroupPerspective) -> () ) -> String? {
        return databaseFirebase().watchGroupContext(groupID: groupID, completion: completion)
    }
    
    func watchAllMyDevices(completion: @escaping (Int) -> () ) -> String? {
        return databaseFirebase().watchAllMyDevices(completion: completion)
    }

    func watchControlsForDevice(deviceID: Int, reset: @escaping () -> (), completion: @escaping (DeviceControl) -> ()) -> String? {
        return databaseFirebase().watchControlsForDevice(deviceID: deviceID, reset: reset, completion: completion)
    }
    
    func watchControl(controlID: Int, completion: @escaping (DeviceControl) -> () ) -> String? {
        return databaseFirebase().watchControl(controlID: controlID, completion: completion)
    }
    
    func watchDevice(deviceID: Int,
                     reset: @escaping () -> (),
                     identity: @escaping (Device) -> (),
                     controls: @escaping (DeviceControl) -> (),
                     vertices: @escaping (Vertex) -> () ) -> String {
        
        return databaseFirebase().watchDevice(deviceID: deviceID, reset: reset, identity: identity, controls: controls, vertices: vertices)
    }
    
    func getDevice(deviceID: Int,
                     reset: @escaping () -> (),
                     identity: @escaping (Device) -> (),
                     controls: @escaping (DeviceControl) -> (),
                     vertices: @escaping (Vertex) -> () ) -> String {
        
        return databaseFirebase().getDevice(deviceID: deviceID, reset: reset, identity: identity, controls: controls, vertices: vertices)
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
        
        return databaseRealm().getDevice(deviceID: deviceID)
        
    }
    
    func getDeviceIdentity(deviceID: Int, identity: @escaping (Device) -> () ) {
        databaseFirebase().getDeviceIdentity(deviceID: deviceID, identity: identity)
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
    
    func getControl(deviceID: Int, controlID: Int, completion: @escaping(DeviceControl) -> () ) {
        
        databaseFirebase().getControl(deviceID: deviceID, controlID: controlID, completion: completion )
        
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
    
    func getVertex(vertexID: String, completion: @escaping (Vertex) -> () ) {
        //databaseFirebase().getVertex(vertexID: vertexID, completion: completion)
    }
    
    func getTheseVertices(controlIDCheckList: [Int], completion: @escaping (Vertex) -> () ) {
        //databaseFirebase().getTheseVertices(controlIDCheckList: controlIDCheckList, completion: completion)
        
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
        databaseFirebase().resetActiveDevices()
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
    
    func downloadImage(storagePath: String) -> UIImageView {
        
        return databaseFirebase().downloadImage(storagePath: storagePath)
    }
    
    func downloadGroupImage(groupID: Int) -> UIImageView {
        return databaseFirebase().downloadGroupImage(groupID: groupID)
    }
    
    func getMyProfile(completion: @escaping (User) -> () ) {
        databaseFirebase().getMyProfile(completion: completion)
    }
    
    func downloadMyProfileImage(heepID: Int) -> UIImageView {
        return databaseFirebase().downloadMyProfileImage(heepID: heepID)
    }
    
}
