//
//  Device.swift
//  mobile_ios
//
//  Created by Jercerb on 4/21/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit

class Device {
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    
    
    //MARK: Initialization
    init?(name: String, photo: UIImage?) {
        //Initialize Stored Properties
        if name.isEmpty {
            return nil
        }
        
        self.name = name
        self.photo = photo
    }
    
}
