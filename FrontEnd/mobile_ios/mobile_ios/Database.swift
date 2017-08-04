//
//  Database.swift
//  mobile_ios
//
//  Created by Jacob on 8/4/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import Foundation

class database {
    let interface = "realm"
    
    func getDevice(deviceID: Int) -> Device? {
        
        switch interface {
        default :
            
            return databaseRealm().getDevice(deviceID: deviceID)
        }
        
        
    }
    
    func writeDevice(device: Device) {
        
        switch interface {
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
        default :
            databaseRealm().flushControlVertices(controlUniqueID: controlUniqueID)
        }
        
    }
    
    func updateDeviceNameAndIcon(device: Device, deviceName: String, iconName: String) {
        
        switch interface {
        default :
            databaseRealm().updateDeviceNameAndIcon(device: device,
                                                    deviceName: deviceName,
                                                    iconName: iconName)
        }
        
    }
    
    
}
