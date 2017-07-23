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
    
    let realm = try! Realm(configuration: configUser)
    
    public func BuildIsHeepDeviceCOP() -> [UInt8] {
        
        return packageCOP(COP: UInt8(0x09), packet: [UInt8]())
    }
    
    public func BuildSetValueCOP(controlID: Int, newValue: Int) -> [UInt8] {
        let COP = UInt8(0x0A)
        var setVal = 0
        
        if newValue > 0 {
            setVal = newValue
        }
        
        let packet = [UInt8(controlID), UInt8(setVal)]
        let entireArray = packageCOP(COP: COP, packet: packet)
        return entireArray
    }
    
    public func BuildSetVertexCOP(vertex: Vertex) -> [UInt8] {
        let COP = UInt8(0x0C)
        let packet = prepareVertexPacket(vertex: vertex)
        let entireArray = packageCOP(COP: COP, packet: packet)
        return entireArray
    }
    
    public func BuildDeleteVertexCOP(vertex: Vertex) -> [UInt8] {
        let COP = UInt8(0x0D)
        let packet = prepareVertexPacket(vertex: vertex)
        let entireArray = packageCOP(COP: COP, packet: packet)
        return entireArray
    }
    
    public func BuildAdminMOP(deviceID: Int, adminID: Int) -> [UInt8] {
        let MOP = UInt8(0x17)
        let packet = convertIntToByteArray(integer: adminID)
        let entireArray = packageMOP(MOP: MOP, deviceID: deviceID, packet: packet)
        return entireArray
    }
    
    public func BuildControlContextMOP(controlContext: DeviceControl) -> [UInt8]  {
        let MOP = UInt8(0x1A)
        var packet = convertIntToByteArray(integer: controlContext.controlID)
        packet.append(contentsOf: convertIntToByteArray(integer: controlContext.groupID, size: 4))
        packet.append(contentsOf: convertIntToByteArray(integer: Int(controlContext.editX.rounded()), size: 2))
        packet.append(contentsOf: convertIntToByteArray(integer: Int(controlContext.editY.rounded()), size: 2))
        packet.append(contentsOf: convertIntToByteArray(integer: Int(controlContext.scale * 100), size: 2))
        packet.append(contentsOf: convertIntToByteArray(integer: Int((controlContext.rotation + CGFloat.pi) * 100), size: 2))
        
        let entireArray = packageMOP(MOP: MOP, deviceID: controlContext.deviceID, packet: packet)
        return entireArray
    }
    
    public func BuildStoreMOPCOP(byteArray: [UInt8]) -> [UInt8] {
        let COP = UInt8(0x13)
        let entireArray = packageCOP(COP: COP, packet: byteArray)
        return entireArray
    }
    
    func prepareVertexPacket(vertex: Vertex) -> [UInt8] {
        
        var packet = [UInt8]()
        let txDeviceID = GetDeviceIDBytesFromInt(deviceID: (vertex.tx?.deviceID)!)
        let rxDeviceID = GetDeviceIDBytesFromInt(deviceID: (vertex.rx?.deviceID)!)
        let txControlID = (vertex.tx?.controlID)!
        let rxControlID = (vertex.rx?.controlID)!
        
        let rxDevice = realm.object(ofType: Device.self, forPrimaryKey: (vertex.rx?.deviceID)!)
        let rxIPAddress = IPStringToByteArray(IPString: (rxDevice?.ipAddress)!)
        
        packet.append(contentsOf: txDeviceID)
        packet.append(contentsOf: rxDeviceID)
        packet.append(UInt8(txControlID))
        packet.append(UInt8(rxControlID))
        packet.append(contentsOf: rxIPAddress)
        
        return packet
    }
    
    func IPStringToByteArray(IPString: String) -> [UInt8] {
        let split = IPString.characters.split(separator: ".").map(String.init)
        return split.map { UInt8($0)!}
    }
    
    public func packageCOP(COP: UInt8, packet: [UInt8]) -> [UInt8] {
        let numBytes = UInt8(packet.count)
        return [COP, numBytes] + packet
    }
    
    public func packageMOP(MOP: UInt8, deviceID: Int, packet: [UInt8]) -> [UInt8] {
        let numBytes = UInt8(packet.count)
        let deviceIDArray = convertIntToByteArray(integer: deviceID)
        print(deviceIDArray)
        return [MOP] + deviceIDArray + [numBytes] + packet
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
            SuccessROPReceived = true
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
        let packet = CalculateNumberOfBytes(dump: dump, index: header.index)
        var index = packet.index
        while (index < dump.count) {
            index = InterpretNextMOP(dump: dump, index: index, ipAddress: ipAddress)
        }
        
    }
    
    func InterpretNextMOP(dump: [UInt8], index: Int, ipAddress: String) -> Int {
        let thisMOP = dump[index]
        let header = ParseDeviceID(dump: dump, index: index + 1)
        let packet = CalculateNumberOfBytes(dump: dump, index: header.index)
        print("Next MOP: \(thisMOP) from \(header.deviceID)")
        
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
            
        } else if (thisMOP == 0x17) {
            // AdminID 
            ParseDeviceAdmin(dump: dump, index: packet.index, packetSize: packet.numBytes, deviceID: header.deviceID)
            
        } else if (thisMOP == 0x1A) {
            // Control Context 
            ParseControlContext(dump: dump, index: packet.index, packetSize: packet.numBytes, deviceID: header.deviceID)
            
        } else {
            // Unknown MOP or misinterpreted datastream
        }
        
        return packet.index + packet.numBytes
    }
    
    func searchForSpecificMOP(dump: [UInt8], targetMOP: UInt8) -> [UInt8]? {
        print(dump)
        let header = ParseDeviceID(dump: dump, index: 1)
        let packet = CalculateNumberOfBytes(dump: dump, index: header.index)
        var index = packet.index
        
        while (index < dump.count) {
            let header = ParseDeviceID(dump: dump, index: index + 1)
            let packet = CalculateNumberOfBytes(dump: dump, index: header.index)
            
            if dump[index] == targetMOP {
                print("FOUND MOP")
                return Array(dump[index ... index + packet.numBytes])
            }
            
            index = packet.index + packet.numBytes
            
        }
        
        return nil
    }
    
    func CalculateNumberOfBytes(dump: [UInt8], index: Int) -> (numBytes: Int, index: Int) {
        // currently only supporting up to 256 bytes
        return (Int(dump[index]), index + 1)
    }
    
    func ParseDevice(dump: [UInt8], index: Int, deviceID: Int, ipAddress: String) {
        AddNewDevice(deviceID: deviceID, ipAddress: ipAddress)
        
    }
    
    func AddNewDevice(deviceID: Int, ipAddress: String) {
        print("Found a new device... adding now")
        
        let newDevice = Device()
        newDevice.deviceID = deviceID
        newDevice.ipAddress = ipAddress
        
        try! realm.write {
            realm.add(newDevice, update: true)
        }
        
        
    }
    
    func ParseDeviceAdmin(dump: [UInt8], index: Int, packetSize: Int, deviceID: Int) {
    
        if let device = realm.object(ofType: Device.self, forPrimaryKey: deviceID) {
            let adminByteArray = Array(dump[index...index+packetSize-1])
            let adminID = convertArrayToInt(byteArray: adminByteArray, reverse: true)
            print("PARSED ADMIN ID: \(adminID)")
            
            try! realm.write {
                device.humanAdmin = adminID
            }
        }
    }
    
    func ParseControlContext(dump: [UInt8], index: Int, packetSize: Int, deviceID: Int) {
        let uniqueID = generateUniqueControlID(deviceID: deviceID, controlID: dump[index])
        
        if let control = realm.object(ofType: DeviceControl.self, forPrimaryKey: uniqueID) {
            print(dump)
            let groupID = convertArrayToInt(byteArray: Array(dump[index + 1 ... index + 4]), reverse: true)
            let x = CGFloat(convertArrayToInt(byteArray: Array(dump[index + 5 ... index + 6]), reverse: true))
            let y = CGFloat(convertArrayToInt(byteArray: Array(dump[index + 7 ... index + 8]), reverse: true))
            let scale = CGFloat(convertArrayToInt(byteArray: Array(dump[index + 9 ... index + 10]), reverse: true)) / 100
            let rotation = (CGFloat(convertArrayToInt(byteArray: Array(dump[index + 11 ... index + 12]), reverse: true)) / 100) - CGFloat.pi
            
            try! realm.write {
                control.groupID = groupID
                control.editX = x
                control.editY = y
                control.scale = scale
                control.rotation = rotation
            }
        }
    }
    
    func AddControlToDevice(dump: [UInt8], index: Int, deviceID: Int, packetSize: Int ) {
        
        let controlName = GetStringFromByteArrayIndices(dump: dump, indexStart: index + 6, indexFinish: index + packetSize)
        
        let uniqueID = generateUniqueControlID(deviceID: deviceID, controlID: dump[index])
        let existingControl = realm.object(ofType: DeviceControl.self, forPrimaryKey: uniqueID)
        
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
        
        let realm = try! Realm(configuration: configUser)
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
                
                realm.create(DeviceControl.self,
                             value: ["uniqueID": (txControl?.uniqueID)!,
                                     "vertexList": txVertices],
                             update: true)
            }
        }
        
        
    }
    
    func flushControlVertices(controlUniqueID: Int) {
        let realm = try! Realm(configuration: configUser)
        let thisControl = realm.object(ofType: DeviceControl.self, forPrimaryKey: controlUniqueID)
        try! realm.write {
            
            realm.delete((thisControl?.vertexList)!)
        }
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
