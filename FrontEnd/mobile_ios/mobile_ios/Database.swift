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
            databaseRealm().updatePlaceContext(placeContext: placeContext)
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
            let id = databaseRealm().createNewPlace()
            databaseFirebase().createNewPlace(placeID: id)
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
        default :
            return databaseRealm().updateGroup(update: update)
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
        case "both" :
            databaseRealm().signOut()
            databaseFirebase().signOut()
        default :
            databaseRealm().signOut()
        }
    }
    
    
    func getPlaceContext(id: Int) -> PlacePerspective? {
        
        switch interface {
        default :
            return databaseRealm().getPlaceContext(id: id)
        }
    }
    
    func getMyPlaces() -> [PlacePerspective] {
        
        switch interface {
        default :
            return databaseRealm().getMyPlaces()
        }
    }
    
    func watchPlaces(callback: @escaping () -> Void = {}) -> NotificationToken {
        
        switch interface {
        default :
            return databaseRealm().watchPlaces(callback: callback)
        }
    }
    
    func getPlace(context: PlacePerspective) -> Place? {
        
        switch interface {
        default :
            return databaseRealm().getPlace(realmPath: context.realmPath)
        }
        
    }
    
    func getPlaceAsync(context: PlacePerspective, callback: @escaping () -> Void = {}) {
        
        switch interface {
        default :
            databaseRealm().getPlaceAsync(realmPath: context.realmPath, callback: callback)
        }
    }
    
    func getGroup(context: GroupPerspective) -> Group? {
        
        switch interface {
        default :
            return databaseRealm().getGroup(path: context.realmPath)
        }
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
        
        switch interface {
        default :
            return databaseRealm().getGroupContextsForPlace(placeID: placeID)
        }
        
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
    
    func getUserIcon(heepID: Int?) -> UIImage {
        
        switch interface {
        default :
            return databaseRealm().getUserIcon(heepID: heepID)
        }
    }
    
    func getMyHeepID() -> Int? {
        
        switch interface {
        default :
            return databaseRealm().getMyHeepID()
        }
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
    
    
    
}
