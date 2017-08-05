//
//  Database_Realm.swift
//  mobile_ios
//
//  Created by Jacob on 8/4/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import Foundation
import Firebase

class databaseFirebase {
    
    func writeDevice(device: Device) {
        ref.child("devices").child(String(describing: device.deviceID)).setValue(device.toDict())
        
    }
    
    func updateDeviceControl(control: DeviceControl) {
        
        ref.child("controls").child(String(describing: control.uniqueID)).setValue(control.toDict())
    }
    
    func writeVertex(vertex: Vertex) {
        
        ref.child("vertices").child(String(describing: vertex.vertexID)).setValue(["vertexID": vertex.vertexID,
                                                                                   "txID": (vertex.tx?.uniqueID)!,
                                                                                   "rxID": (vertex.rx?.uniqueID)!])
    }
    
    func updateDeviceNameAndIcon(device: Device, deviceName: String, iconName: String) {
        print("Updating name and icon")
        
        let updates = ["/devices/\(device.deviceID)/name": deviceName,
                       "/devices/\(device.deviceID)/iconName": iconName]
        
        ref.updateChildValues(updates)
        
    }
    
    func flushControlVertices(controlUniqueID: Int) {
        
        
        ref.child("vertices").queryOrdered(byChild:"txID").queryEqual(toValue: controlUniqueID).observe(.value, with: { snapshot in
            
            print("SNAPSHOT: \(snapshot)")
            snapshot.ref.removeValue()
            
        })
    }
    
    func createNewPlace(placeID: Int = randomNumber(inRange: 0...4000000000)) {
        
        let newPlace = Place()
        newPlace.name = "New Place"
        newPlace.placeID = placeID
        
        let newPlacePerspective = PlacePerspective()
        newPlacePerspective.placeID = placeID
        
        ref.child("places").child(String(describing: newPlace.placeID)).setValue(newPlace.toDict())
        updatePlaceContext(placeContext: newPlacePerspective)
        
    }
    
    func updatePlaceContext(placeContext: PlacePerspective) {
        
        guard let userID = Auth.auth().currentUser?.uid else {
            print("No Firebase User Logged In")
            return
        }
        
        ref.child("users/\(String(describing: userID))/places/\(placeContext.placeID)").setValue(placeContext.toDict())
        
    }
    
    func registerNewUser(email: String, password: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            // ...
            if (error != nil) {
                print("ERROR: \(String(describing: error))")
            }
            let heepID = randomNumber(inRange: 1...1000000)
            
            ref.child("users").child(String(describing: (user?.uid)!)).setValue(["heepID": heepID])
            
            print("USER: \(String(describing: user))")
        }
    }
    
    func signOut() {
        
        let firebaseAuth = Auth.auth()
        
        do {
            
            try firebaseAuth.signOut()
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}

