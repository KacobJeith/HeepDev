//
//  Device.swift
//  mobile_ios
//
//  Created by Jercerb on 4/21/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import Foundation

class Device {
    //MARK: Properties
    
    public var name: String
    public var deviceID: Int
    public var version: Int
    public var iconName: String
    public var ipAddress: String
    public var controlList =  [DeviceControl]()
    
    //MARK: Initialization
    init(deviceID: Int) {
        
        self.name = ""
        self.deviceID = deviceID
        self.version = 1
        self.ipAddress = "10.0.0.0"
        self.iconName = "lightbulb"
        self.controlList = [DeviceControl]()
    }
    
    
    
}
