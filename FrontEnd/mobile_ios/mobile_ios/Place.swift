//
//  Place.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/11/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import Foundation

class Place {
    
    var ssid: String
    var name: String
    var devices: [UInt8]
    var rooms: [String : [UInt8]]
    var groups: [String : [UInt8]]
    
    init() {
        self.ssid = "placeholder"
        self.name = "unnamed"
        self.devices = []
        self.rooms = [:]
        self.groups = [:]
    }
    
    
}
