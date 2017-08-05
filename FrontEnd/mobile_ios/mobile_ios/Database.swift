//
//  Database.swift
//  mobile_ios
//
//  Created by Jacob on 8/4/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import Foundation

class database {
    let interface = "both"
    
    func getDevice(deviceID: Int) -> Device? {
        
        switch interface {
        default :
            return databaseRealm().getDevice(deviceID: deviceID)
        }
        
        
    }
    
    func writeDevice(device: Device) {
        
        switch interface {
        case "both" :
            databaseRealm().writeDevice(device: device)
            databaseFirebase().writeDevice(device: device)
            
        default :
            databaseRealm().writeDevice(device: device)
        }
        
    }
    
    func getDeviceControl(uniqueID: Int) -> DeviceControl? {
        
        switch interface {
        default :
            return databaseRealm().getDeviceControl(uniqueID: uniqueID)
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
    
    func getVertex(vertexID: String) -> Vertex? {
        
        switch interface {
        default :
            return databaseRealm().getVertex(vertexID: vertexID)
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
            databaseRealm().createNewPlace()
            databaseFirebase().createNewPlace()
        default :
            databaseRealm().createNewPlace()
        }
    }
    
    func registerNewUser(name: String, email: String, password: String) {
        
        switch interface {
        case "firebase" :
            databaseFirebase().registerNewUser(email: email, password: password)
        case "both" :
            databaseRealm().registerNewUser(name: name, email: email, password: password)
            databaseFirebase().registerNewUser(email: email, password: password)
        default :
            databaseRealm().registerNewUser(name: name, email: email, password: password)
        }
    }
    
    
}
