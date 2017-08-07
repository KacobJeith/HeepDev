//
//  Database_Realm.swift
//  mobile_ios
//
//  Created by Jacob on 8/4/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import Foundation
import Firebase


var ref: DatabaseReference! = Database.database().reference()

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
    
    func createNewPlace(place: PlacePerspective = PlacePerspective()) {
        
        let newPlace = Place()
        newPlace.name = "New Place"
        newPlace.placeID = place.placeID
        
        ref.child("places").child(String(describing: newPlace.placeID)).setValue(newPlace.toDict())
        updatePlaceContext(placeContext: place)
        
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
            
            self.updateUserIcon(profile: newUser)
            
            print("USER: \(String(describing: user))")
        }
    }
    
    func updateUserIcon(profile: User) {
        if profile.icon != NSData() {
            
            let profileReference = Storage.storage().reference().child("users/\(String(describing: profile.heepID))/profile.jpg")
            let data = profile.icon as Data
            
            profileReference.putData(data, metadata: nil) { (metadata, error) in
                guard let metadata = metadata else {
                    print("Uh-oh, an upload error occurred: \(String(describing: error))")
                    return
                }
                
                print("Metadata: \(metadata)")
                
            }
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
    
    func getPlaceContext(id: Int, completion: @escaping (PlacePerspective?) -> () ) {
        
        guard let userID = Auth.auth().currentUser?.uid else {
            print("You must be logged in to perform this action")
            return
        }
        
        ref.child("users/\(userID)/places/\(String(describing: id))").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            let context = PlacePerspective()
            context.numDevices = value?["numDevices"] as? Int ?? 0
            context.placeID = value?["placeID"] as? Int ?? 0
            context.radius = value?["radius"] as? Int ?? 0
            context.realmPath = value?["realmPath"] as? String ?? "empty"
            context.x = value?["x"] as? CGFloat ?? 0
            context.y = value?["y"] as? CGFloat ?? 0
            
            completion(context)
            
        }) { (error) in
            print(error)
            return
        }
    }
    
    func getPlaceContexts(completion: @escaping (PlacePerspective) -> () ) {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("You must be logged in to perform this action")
            return
        }
        
        ref.child("users/\(userID)/places").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let enumerator = snapshot.children
            print("NUM: \(snapshot.childrenCount)")
            
            while let child = enumerator.nextObject() as? DataSnapshot {
                
                let value = child.value as? NSDictionary
                
                let context = PlacePerspective()
                context.numDevices = value?["numDevices"] as? Int ?? 0
                context.placeID = value?["placeID"] as? Int ?? 0
                context.radius = value?["radius"] as? Int ?? 0
                context.realmPath = value?["realmPath"] as? String ?? "empty"
                context.x = value?["x"] as? CGFloat ?? 0
                context.y = value?["y"] as? CGFloat ?? 0
                
                completion(context)
            }
            
            
        }) { (error) in
            print(error)
            return
        }
    }
    
    func watchPlaces(completion: @escaping () -> () ) {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("You must be logged in to perform this action")
            return
        }
        
        ref.child("users/\(userID)/places").observe(.value, with: { (snapshot) in
            completion()
            
        }) { (error) in
            print(error)
            return
        }
    }
    
    
    
    func getPlace(context: PlacePerspective, completion: @escaping (Place) -> () ) {
        
        ref.child("places/\(String(describing: context.placeID))").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            let place = Place()
            place.placeID = value?["placeID"] as? Int ?? 0
            place.name = value?["name"] as? String ?? ""
            
            completion(place)
            
        }) { (error) in
            print(error)
            return
        }
    }
}

