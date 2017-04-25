//
//  DeviceControl.swift
//  mobile_ios
//
//  Created by Jercerb on 4/22/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import Foundation

class DeviceControl {
    //MARK: Properties
    
    var deviceID: Int
    var controlID: Int
    var controlType: Int
    var controlDirection: Int
    var valueLow: Int
    var valueHigh: Int
    var valueCurrent: Int
    var controlName: String
    
    
    //MARK: Initialization
    /*
    init() {
        
        self.deviceID = 0
        self.controlID = 0
        self.controlType = 0
        self.controlDirection = 0
        self.valueLow = 0
        self.valueHigh = 0
        self.valueCurrent = 0
        self.controlName = "undefined"
    }*/
    
    init(deviceID: Int,
         controlID: Int,
         controlType: Int,
         controlDirection: Int,
         valueLow: Int,
         valueHigh: Int,
         valueCurrent: Int,
         controlName: String) {
        
        self.deviceID = deviceID
        self.controlID = controlID
        self.controlType = controlType
        self.controlDirection = controlDirection
        self.valueLow = valueLow
        self.valueHigh = valueHigh
        self.valueCurrent = valueCurrent
        self.controlName = controlName
    }
    
}
