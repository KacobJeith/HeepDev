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
    
    var name: String
    var deviceID: Int
    var version: Int
    var iconName: String
    var ipAddress: String
    var controlList =  [DeviceControl]()
    
    //MARK: Initialization
    init(deviceID: Int) {
        
        self.name = ""
        self.deviceID = deviceID
        self.version = 1
        self.ipAddress = "4.3.3.7"
        self.iconName = "lightbulb"
        self.controlList = [DeviceControl]()
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func setIPAddress(ipAddress: String) {
        self.ipAddress = ipAddress
    }
    
    func setIconName(iconName: String){
        self.iconName = iconName
    }
    
}
