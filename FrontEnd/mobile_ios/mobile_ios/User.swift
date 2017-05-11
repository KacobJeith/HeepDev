//
//  User.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/10/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import Foundation

class User {
    
    var name: String
    var email: String
    var password: String
    var keys: [UInt8: UInt8]
    var devices: [UInt8: Device]
    var places: [String: Place]
    var rooms: [String: [UInt8]]
    
    init() {
        self.name = "Guest"
        self.email = ""
        self.password = ""
        self.keys = [:]
        self.devices = [:]
        self.places = [:]
        self.rooms = [:]
    }
    
}
