//
//  Device.swift
//  mobile_ios
//
//  Created by Jercerb on 4/21/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import Foundation
import mobile_ios

class Device {
    //MARK: Properties
    
    var name: String
    var deviceID: Int
    var version: Int
    var controlList =  [DeviceControl]()
    
    //MARK: Initialization
    init(deviceID: Int) {
        
        self.name = ""
        self.deviceID = deviceID
        self.version = 1
        self.controlList = [DeviceControl]()
    }
    
    
    
}
