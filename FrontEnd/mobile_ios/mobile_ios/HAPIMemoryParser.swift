//
//  HAPIMemoryParser.swift
//  mobile_ios
//
//  Created by Jercerb on 4/21/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit

var deviceMap = [Int: Int]()

class HAPIMemoryParser {
    
    
    public static func BuildIsHeepDeviceCOP() -> [UInt8] {
        
        return [0x09, 0x00]
    }
    
    public static func ParseROP(dump: [UInt8]) -> Bool {
        var newData = false
        
        if (dump[0] == 0x0F){
            // Memory Dump
            print("Detected a Memory Dump")
            newData = ParseMemoryDump(dump: dump)
            
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

        }
        
        return newData
        
    }
    
    public static func ParseMemoryDump(dump: [UInt8]) -> Bool {
        print(dump)
        
        let header = ParseDeviceID(dump: dump, index: 1)
        
        if (CheckDevicePositionInArray(deviceID: header.deviceID) != nil) {
            return false
        }
        
        let packet = CalculateNumberOfBytes(dump: dump, index: header.index)
        var index = packet.index
        
        while (index < dump.count) {
            index = InterpretNextMOP(dump: dump, index: index)
        }
        
        return true
    }
    
    private static func InterpretNextMOP(dump: [UInt8], index: Int) -> Int {
        let thisMOP = dump[index]
        let header = ParseDeviceID(dump: dump, index: index + 1)
        let packet = CalculateNumberOfBytes(dump: dump, index: header.index)
        print("Next MOP: \(thisMOP)")
        
        if (thisMOP == 0x01) {
            // Device Data: ID & Version
            ParseDevice(dump: dump, index: packet.index, deviceID: header.deviceID)
            
        } else if (thisMOP == 0x02) {
            // Control Definition: Control Type is sub OP
            
        } else if (thisMOP == 0x03) {
            // Vertex Definition
            
        } else if (thisMOP == 0x04) {
            // Icon ID
            
        } else if (thisMOP == 0x05) {
            // Custom Icon Drawing
            
        } else if (thisMOP == 0x06) {
            // Client Name
            
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
    
    private static func ParseDevice(dump: [UInt8], index: Int, deviceID: Int) {
        //let version = dump[index]
        
        if (CheckDevicePositionInArray(deviceID: deviceID) == nil) {
            AddNewDevice(deviceID: deviceID)
        } else { /* No new data found */ }
        
    }
    
    private static func CalculateNumberOfBytes(dump: [UInt8], index: Int) -> (numBytes: Int, index: Int) {
        // currently only supporting up to 256 bytes
        return (Int(dump[index]), index + 1)
    }
    
    
    private static func AddNewDevice(deviceID: Int) {
        print("Found a new device... adding now")
        deviceMap[deviceID] = deviceMap.count + 1
        let newDevice = Device(deviceID: deviceID)
        devices.append(newDevice)
    }
    
    private static func AddControlToDevice(dump: [UInt8], index: Int, deviceID: Int ) {
        print("Adding Control to device: \(deviceID)")
        
    }
    
    private static func CheckDevicePositionInArray(deviceID: Int) -> Int? {
        return deviceMap[deviceID]
        
    }
    
    public static func ParseDeviceID(dump: [UInt8], index: Int) -> (index: Int, deviceID: Int) {
        let id1: Int = Int(dump[index])
        let id2: Int = Int(dump[index+1])
        let id3: Int = Int(dump[index+2])
        let id4: Int = Int(dump[index+3])
        
        let deviceID = (id1 << 24) + (id2 << 16) + (id3 << 8) + id4
        
        return (index + 4, deviceID)
    }
    
    
    
    
    
}
