//
//  HAPIMemoryParser.swift
//  mobile_ios
//
//  Created by Jercerb on 4/21/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import RealmSwift

class HAPIMemoryParser {
    
    let realm = try! Realm(configuration: config)
    
    public func BuildIsHeepDeviceCOP() -> [UInt8] {
        
        return packageCOP(COP: UInt8(0x09), packet: [UInt8]())
    }
    
    public func BuildSetValueCOP(controlID: Int, newValue: Int) -> [UInt8] {
        let COP = UInt8(0x0A)
        let packet = [UInt8(controlID), UInt8(newValue)]
        let entireArray = packageCOP(COP: COP, packet: packet)
        return entireArray
    }
    
    public func BuildSetVertexCOP(vertex: Vertex) -> [UInt8] {
        let COP = UInt8(0x0C)
        var packet = [UInt8]()
        let txDeviceID = GetDeviceIDBytesFromInt(deviceID: (vertex.tx?.deviceID)!)
        let rxDeviceID = GetDeviceIDBytesFromInt(deviceID: (vertex.rx?.deviceID)!)
        let txControlID = (vertex.tx?.controlID)!
        let rxControlID = (vertex.rx?.controlID)!
        
        let rxDevice = realm.object(ofType: Device.self, forPrimaryKey: (vertex.rx?.deviceID)!)
        let rxIPAddress = IPStringToByteArray(IPString: (rxDevice?.ipAddress)!)
        print("txDeviceID: \(txDeviceID)")
        print("rxDeviceID: \(rxDeviceID)")
        print("txControlID: \(txControlID)")
        print("rxControlID: \(rxControlID)")
        
        packet.append(contentsOf: txDeviceID)
        packet.append(contentsOf: rxDeviceID)
        packet.append(UInt8(txControlID))
        packet.append(UInt8(rxControlID))
        packet.append(contentsOf: rxIPAddress)
        
        let entireArray = packageCOP(COP: COP, packet: packet)
        return entireArray
    }
    
    func IPStringToByteArray(IPString: String) -> [UInt8] {
        let split = IPString.characters.split(separator: ".").map(String.init)
        return split.map { UInt8($0)!}
    }
    
    public func packageCOP(COP: UInt8, packet: [UInt8]) -> [UInt8] {
        let numBytes = UInt8(packet.count)
        return [COP, numBytes] + packet
    }
    
    public func GetDeviceIDBytesFromInt(deviceID: Int) -> [UInt8] {
        let byte4 = UInt8(truncatingBitPattern: deviceID)
        let byte3 = UInt8(truncatingBitPattern: deviceID >> 8)
        let byte2 = UInt8(truncatingBitPattern: deviceID >> 16)
        let byte1 = UInt8(truncatingBitPattern: deviceID >> 24)
        
        return [byte1, byte2, byte3, byte4]
    }
    
    public func ParseROP(dump: [UInt8], ipAddress: String) {
        
        if (dump[0] == 0x0F){
            // Memory Dump
            print("Detected a Memory Dump")
            ParseMemoryDump(dump: dump, ipAddress: ipAddress)
            
        }
        else if ( dump[0] == 0x10){
            // Success ROP
            print("Detected Success ROP")
        }
        else if ( dump[0] == 0x11){
            // Error ROP
            print("Detected Error ROP")        }
        else {
            // Unknown ROP
            print("Heep has no idea what this device is saying....sorry!")
            print(dump[0])

        }
        
        
    }
    
    public func ParseMemoryDump(dump: [UInt8], ipAddress: String) {
        print(dump)
        let header = ParseDeviceID(dump: dump, index: 1)
        //let thisDevice = realm.object(ofType: Device.self, forPrimaryKey: header.deviceID)

        
        //if thisDevice == nil {
            let packet = CalculateNumberOfBytes(dump: dump, index: header.index)
            var index = packet.index
            
            while (index < dump.count) {
                index = InterpretNextMOP(dump: dump, index: index, ipAddress: ipAddress)
            }
        //} else { print("This devices has already been detected")}
        
    }
    
    func InterpretNextMOP(dump: [UInt8], index: Int, ipAddress: String) -> Int {
        let thisMOP = dump[index]
        let header = ParseDeviceID(dump: dump, index: index + 1)
        let packet = CalculateNumberOfBytes(dump: dump, index: header.index)
        //print("Next MOP: \(thisMOP)")
        
        if (thisMOP == 0x01) {
            // Device Data: ID & Version
            ParseDevice(dump: dump, index: packet.index, deviceID: header.deviceID, ipAddress: ipAddress)
            
        } else if (thisMOP == 0x02) {
            // Control Definition: Control Type is sub OP
            AddControlToDevice(dump: dump, index: packet.index, deviceID: header.deviceID, packetSize: packet.numBytes)
            
        } else if (thisMOP == 0x03) {
            // Vertex Definition
            parseVertexMOP(dump: dump, index: packet.index, packetSize: packet.numBytes, deviceID: header.deviceID)
            
        } else if (thisMOP == 0x04) {
            // Icon ID
            
        } else if (thisMOP == 0x05) {
            // Custom Icon Drawing
            
        } else if (thisMOP == 0x06) {
            // Client Name
            ParseDeviceName(dump: dump, index: packet.index, packetSize: packet.numBytes, deviceID: header.deviceID)
            
        } else if (thisMOP == 0x07) {
            // Front End Position
            
        } else if (thisMOP == 0x08) {
            // DeviceIP
            
        } else if (thisMOP == 0x12) {
            // Fragment
            
        } else {
            // Unknown MOP or misinterpreted datastream
        }
        
        return packet.index + packet.numBytes
    }
    
    func CalculateNumberOfBytes(dump: [UInt8], index: Int) -> (numBytes: Int, index: Int) {
        // currently only supporting up to 256 bytes
        return (Int(dump[index]), index + 1)
    }
    
    func ParseDevice(dump: [UInt8], index: Int, deviceID: Int, ipAddress: String) {
        //let version = dump[index]
        //let thisDevice = realm.object(ofType: Device.self, forPrimaryKey: deviceID)
        
        //if thisDevice == nil {
        //    print("Adding anyways...")
            AddNewDevice(deviceID: deviceID, ipAddress: ipAddress)
        //} else { print("This devices has already been detected") }
        
    }
    
    func AddNewDevice(deviceID: Int, ipAddress: String) {
        print("Found a new device... adding now")
        
        let currentWifi = currentWifiInfo()
        let currentPlace = realm.object(ofType: Place.self, forPrimaryKey: currentWifi.bssid)
        
        let newDevice = Device()
        newDevice.deviceID = deviceID
        newDevice.ipAddress = ipAddress
        newDevice.associatedPlace = currentWifi.bssid
        
        try! realm.write {
            
            realm.add(newDevice, update: true)
            //currentPlace?.devices.append(newDevice)
        }
        
        let thisPlaceDevices = realm.objects(Device.self).filter("associatedPlace == %@", currentPlace?.bssid)
        
        try! realm.write {
            realm.create(Place.self,
                         value: ["bssid": currentPlace?.bssid,
                                 "devices": thisPlaceDevices],
                         update: true)
        }
        
    }
    
    func AddControlToDevice(dump: [UInt8], index: Int, deviceID: Int, packetSize: Int ) {
        //print("Adding Control to device: \(deviceID)")
        
        let controlName = GetStringFromByteArrayIndices(dump: dump, indexStart: index + 6, indexFinish: index + packetSize)
        
        let currentWifi = currentWifiInfo()
        let uniqueID = generateUniqueControlID(deviceID: deviceID, controlID: dump[index])
        let existingControl = realm.object(ofType: DeviceControl.self, forPrimaryKey: uniqueID)
        print("\(controlName): \(Int(dump[index + 5]))")
        if existingControl != nil {
            flushControlVertices(controlUniqueID: uniqueID)
            
            try! realm.write {
                existingControl?.deviceID = deviceID
                existingControl?.controlID = Int(dump[index])
                existingControl?.controlType = Int(dump[index + 1])
                existingControl?.controlDirection = Int(dump[index + 2])
                existingControl?.valueLow = Int(dump[index + 3])
                existingControl?.valueHigh = Int(dump[index + 4])
                existingControl?.valueCurrent = Int(dump[index + 5])
                existingControl?.controlName = controlName
                existingControl?.place = currentWifi.bssid
            }
        } else {
            
            let newControl = DeviceControl()
            newControl.deviceID = deviceID
            newControl.controlID = Int(dump[index])
            newControl.uniqueID = uniqueID
            newControl.controlType = Int(dump[index + 1])
            newControl.controlDirection = Int(dump[index + 2])
            newControl.valueLow = Int(dump[index + 3])
            newControl.valueHigh = Int(dump[index + 4])
            newControl.valueCurrent = Int(dump[index + 5])
            newControl.controlName = controlName
            newControl.place = currentWifi.bssid
            
            try! realm.write {
                
                realm.add(newControl, update: true)
                
            }
        }
        
        
        
        // Resolve Addition to device array (masterState)
        let thisDevicesControls = realm.objects(DeviceControl.self).filter("deviceID == %d", deviceID)
        
        try! realm.write {
            realm.create(Device.self,
                         value: ["deviceID": deviceID,
                                 "controlList": thisDevicesControls],
                         update: true)
        }
        
    }
    
    func parseVertexMOP(dump: [UInt8], index: Int, packetSize: Int, deviceID: Int) {
        //print("Reading Vertex from device: \(deviceID)")
        
        let txDeviceID = deviceID
        let rxDeviceID = ParseDeviceIDSimple(dump: dump, index: index)
        let txControlID = dump[index + 4]
        let rxControlID = dump[index + 5]
        
        let realm = try! Realm(configuration: config)
        let txControl = realm.object(ofType: DeviceControl.self,
                                     forPrimaryKey: generateUniqueControlID(deviceID: txDeviceID,
                                                                            controlID: txControlID))
        let rxControl = realm.object(ofType: DeviceControl.self,
                                     forPrimaryKey: generateUniqueControlID(deviceID: rxDeviceID,
                                                                            controlID: rxControlID))
        
        let newVertex = Vertex()
        newVertex.rx = rxControl
        newVertex.tx = txControl
        newVertex.vertexID = nameVertex(tx: txControl, rx: rxControl)
        
        
        
        let existingVertexCheck = realm.object(ofType: Vertex.self, forPrimaryKey: newVertex.vertexID)
        
        if existingVertexCheck == nil && txControl != nil && rxControl != nil {
            
            try! realm.write {
                
                realm.add(newVertex, update: true)
            }
            
            
        }
        
        if txControl != nil {
            let txVertices = realm.objects(Vertex.self).filter("tx == %@", txControl!)
            
            try! realm.write {
                print(txControl?.uniqueID)
                print(txVertices)
                realm.create(DeviceControl.self,
                             value: ["uniqueID": (txControl?.uniqueID)!,
                                     "vertexList": txVertices],
                             update: true)
            }
        }
        
        let allVertices = realm.objects(Vertex.self)
        print(allVertices)
        
    }
    
    func flushControlVertices(controlUniqueID: Int) {
        let realm = try! Realm(configuration: config)
        let thisControl = realm.object(ofType: DeviceControl.self, forPrimaryKey: controlUniqueID)
        try! realm.write {
            
            realm.delete((thisControl?.vertexList)!)
        }
        
        let allVertices = realm.objects(Vertex.self)
        print("After flusing \(thisControl?.controlName)")
        print(allVertices)
    }
    
    
    
    func readIPAddress(dump: [UInt8], index: Int) -> String {
        return String(Int(dump[index])) + "." + String(Int(dump[index + 1])) + "." + String(Int(dump[index + 2])) + "." + String(Int(dump[index + 3]))
    }
    
    func generateUniqueControlID(deviceID: Int, controlID: UInt8) -> Int {
        return (deviceID << 8 ) + Int(controlID)
    }
    
    
    func ParseDeviceName(dump: [UInt8], index: Int, packetSize: Int, deviceID: Int) {
        let deviceName = GetStringFromByteArrayIndices(dump: dump, indexStart: index, indexFinish: index + packetSize - 1)
        
        // Resolve Addition to device array (masterState)
        let thisDevice = realm.object(ofType: Device.self, forPrimaryKey: deviceID)
        if thisDevice != nil {
            //print("Adding Device Name \(deviceName) to device \(deviceID)")
            
            try! realm.write {
                
                thisDevice?.name = deviceName
                thisDevice?.iconName = SuggestIconFromName(name: deviceName)
                
            }
            
        } else {
            print("We haven't seen this device yet...")
        }
        
    }    
    
    func GetStringFromByteArrayIndices(dump: [UInt8], indexStart: Int, indexFinish: Int) -> String {
        let array = Array(dump[indexStart...indexFinish])
        
        if let extractedString = String(bytes: array, encoding: .utf8) {
            return extractedString
        } else {
            return "placeholder"
        }
        
    }

    
    func ParseDeviceID(dump: [UInt8], index: Int) -> (index: Int, deviceID: Int) {
        let id1: Int = Int(dump[index])
        let id2: Int = Int(dump[index+1])
        let id3: Int = Int(dump[index+2])
        let id4: Int = Int(dump[index+3])
        
        let deviceID = (id1 << 24) + (id2 << 16) + (id3 << 8) + id4
        
        return (index + 4, deviceID)
    }
    
    func ParseDeviceIDSimple(dump: [UInt8], index: Int) -> Int {
        let id1: Int = Int(dump[index])
        let id2: Int = Int(dump[index+1])
        let id3: Int = Int(dump[index+2])
        let id4: Int = Int(dump[index+3])
        
        let deviceID = (id1 << 24) + (id2 << 16) + (id3 << 8) + id4
        
        return deviceID
    }
    
}
