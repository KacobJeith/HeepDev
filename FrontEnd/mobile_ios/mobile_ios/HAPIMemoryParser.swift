//
//  HAPIMemoryParser.swift
//  mobile_ios
//
//  Created by Jercerb on 4/21/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import Foundation

class HAPIMemoryParser {
    
    
    public static func BuildIsHeepDeviceCOP() -> [UInt8] {
        
        return [0x09, 0x00]
    }
    
    public static func ParseROP(dump: [UInt8]) -> UInt8 {
        var response = dump[0]
        
        if (dump[0] == 0x0F){
            // Memory Dump
            print("Detected a Memory Dump")
            ParseMemoryDump(dump: dump)
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
            response = 0xFF
        }
        
        return response
        
    }
    
    public static func ParseMemoryDump(dump: [UInt8]) {
        print(dump)
        
        let deviceID = ParseClientID(dump: dump, index: 1)
        print(deviceID)
    }
    
    
    
    public static func ParseClientID(dump: [UInt8], index: Int) -> UInt32 {
        
        let array = dump[index...(index+3)]
        let data = Data(bytes: array)
        let deviceID = UInt32(bigEndian: data.withUnsafeBytes { $0.pointee })
        
        return deviceID
    }
    
    
    
}
