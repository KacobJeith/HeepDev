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
    
}
