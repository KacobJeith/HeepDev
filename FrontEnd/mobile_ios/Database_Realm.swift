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

class database {
    let realm = try! Realm(configuration: configUser)
    
    func getDevice(deviceID: Int) -> Device? {
        return realm.object(ofType: Device.self, forPrimaryKey: deviceID)
    
    }
    
    func writeDevice(device: Device) {
        
        try! realm.write {
            realm.add(device, update: true)
        }
        
    }
    
    func getDeviceControl(uniqueID: Int) -> DeviceControl? {
        
        return realm.object(ofType: DeviceControl.self, forPrimaryKey: uniqueID)
        
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
    
    func updateDeviceNameAndIcon(device: Device, deviceName: String, iconName: String) {
        
        try! realm.write {
            device.name = deviceName
            device.iconName = iconName
            
        }
    }
    
    
}
