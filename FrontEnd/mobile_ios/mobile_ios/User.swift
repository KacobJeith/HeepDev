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
    var keys: [Int: Int]
    var devices: [Int: Device]
    var places: [String: Place]
    var rooms: [String: [Int]]
    
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
