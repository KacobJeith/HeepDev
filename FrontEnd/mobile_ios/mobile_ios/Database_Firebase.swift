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
    
    func deleteVertex(vertex: Vertex) {
        
        ref.child("vertices").child(vertex.vertexID).removeValue()
    
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
        
        ref.child("users/\(userID)/places/\(placeContext.placeID)").setValue(placeContext.toDict())
        
    }
    
    func createNewGroup(placeID: Int, groupID: Int = randomNumber(inRange: 0...4000000000)) {
    
        let newGroup = Group()
        newGroup.groupID = groupID
        newGroup.placeID = placeID
        
        let newGroupContext = GroupPerspective()
        newGroupContext.groupID = groupID
        newGroupContext.placeID = placeID
        
        updateGroup(group: newGroup)
        updateGroupContext(context: newGroupContext)
    }
    
    func updateGroupContext(context: GroupPerspective) {
        
        guard let userID = Auth.auth().currentUser?.uid else {
            print("No Firebase User Logged In")
            return
        }
        
        ref.child("users/\(userID)/groups/\(context.groupID)").setValue(context.toDict())
        
    }
    
    func updateGroup(group: Group) {
        
        ref.child("groups").child(String(describing: group.groupID)).setValue(["groupID": group.groupID,
                                                                               "placeID": group.placeID,
                                                                               "name": group.name])
        
        updateGroupImage(group: group)
    }
    
    func updateGroupImage(group: Group) {
        if group.imageData != NSData() {
            
            let groupReference = Storage.storage().reference().child("groups/\(String(describing: group.groupID))/background.jpg")
            let data = group.imageData as Data
            
            groupReference.putData(data, metadata: nil) { (metadata, error) in
                guard let metadata = metadata else {
                    print("Uh-oh, an upload error occurred: \(error)")
                    return
                }
                
                print("Metadata: \(metadata)")
                
            }
            
        }
    }
    
    func registerNewUser(newUser: User, email: String, password: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            // ...
            if (error != nil) {
                print("ERROR: \(String(describing: error))")
            }
            
            guard let userID = user?.uid else {
                print("Couldn't grab userID")
                return
            }
            
            ref.child("users/\(userID)/profile").setValue(["heepID": newUser.heepID,
                                                           "name": newUser.name,
                                                           "email": email])
            
            ref.child("userDirectory/").setValue([String(describing: newUser.heepID): userID])
            
            print("USER: \(String(describing: user))")
        }
    }
    
    func updateUserIcon(image: NSData?) {
        if image == nil {
            
        }
    }
    
    func loginUser(email: String, password: String, callback: @escaping () -> Void = {}) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            // ...
            if error != nil {
                print("Firebase Login Error")
            } else {
                print("Successfully logged in user to firebase \(String(describing: user))")
            }
            
            //callback()
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

