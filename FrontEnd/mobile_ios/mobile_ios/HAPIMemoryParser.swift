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
        var bufferarray = [UInt8]()
        bufferarray.append(0x09)
        bufferarray.append(0x00)
        
        return bufferarray
    }
    
    public static func ParseROP(dump: [UInt8]) {
        
        if (dump[0] == 0x0F){
            // Memory Dump
            print("Detected a Memory Dump")
            print(dump)
        }
        else if ( dump[0] == 0x10){
            // Success ROP
            print("Detected Success ROP")
            
        }
        else if ( dump[0] == 0x11){
            // Error ROP
            print("Detected Error ROP")
        }
        else {
            // Unknown ROP
        }
        
    }
    
    public static func ParseMemoryDump(dump: [UInt8]) {
        print(dump)
        
    }
    
    
    
    func ParseClientID(dump: [UInt8], index: Int) {
        
    }
    
    
    
}
