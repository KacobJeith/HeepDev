//
//  Database.swift
//  mobile_ios
//
//  Created by Jacob on 8/4/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import Foundation
import UIKit

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
    
    func getPlaceContext(id: Int) -> PlacePerspective? {
        
        switch interface {
        default :
            return databaseRealm().getPlaceContext(id: id)
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
        case "both" :
            let id = databaseRealm().createNewPlace()
            databaseFirebase().createNewPlace(placeID: id)
        default :
            _ = databaseRealm().createNewPlace()
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
    
    func getMyPlaces() -> [PlacePerspective] {
        
        switch interface {
        default :
            return databaseRealm().getMyPlaces()
        }
    }
    
    func getPlace(realmPath: String) -> Place? {
        
        switch interface {
        default :
            return databaseRealm().getPlace(realmPath: realmPath)
        }
        
    }
    
    func getPlaceAsync(realmPath: String, callback: @escaping () -> Void = {}) {
        
        switch interface {
        default :
            databaseRealm().getPlaceAsync(realmPath: realmPath, callback: callback)
        }
    }
    
    func getDevice(deviceID: Int) -> Device? {
        
        switch interface {
        default :
            return databaseRealm().getDevice(deviceID: deviceID)
        }
        
        
    }
    
    func getDeviceControl(uniqueID: Int) -> DeviceControl? {
        
        switch interface {
        default :
            return databaseRealm().getDeviceControl(uniqueID: uniqueID)
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
    
    
    
}
