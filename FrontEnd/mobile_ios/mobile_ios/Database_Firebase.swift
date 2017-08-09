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
    
    func writeDeviceControl(control:DeviceControl) {
        
        guard let userID = Auth.auth().currentUser?.uid else {
            print("No Firebase User Logged In")
            return
        }
        
        let controlID = String(describing: control.uniqueID)
        ref.child("users/\(userID)/controls/\(controlID)").setValue([controlID: true])
        
        updateDeviceControl(control: control)
    }
    
    func updateDeviceControl(control: DeviceControl) {
        
        let controlID = String(describing: control.uniqueID)
        
        ref.child("controls").child(controlID).setValue(control.toDict())
        
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
            
            let groupReference = Storage.storage().reference().child("groups/\(String(describing: group.groupID))/background.png")
            let data = group.imageData as Data
            
            groupReference.putData(data, metadata: nil) { (metadata, error) in
                guard let metadata = metadata else {
                    print("Uh-oh, an upload error occurred: \(String(describing: error))")
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
            
            let profileReference = Storage.storage().reference().child("users/\(String(describing: profile.heepID))/profile.png")
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
    
    func watchPlaces(completion: @escaping () -> () ) -> String? {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("You must be logged in to perform this action")
            return nil
        }
        
        let refPath = "users/\(userID)/places"
        
        ref.child(refPath).observe(.value, with: { (snapshot) in
            completion()
            
        }) { (error) in
            print(error)
            return
        }
        
        return refPath
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
    
    func getUserIcon(heepID: Int?, completion: @escaping () -> () ) {
        
        guard let id = heepID else {
            print("Must be logged in for this")
            return
        }
        
        let documentsDirectoryURL = try! FileManager().url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentsDirectoryURL.appendingPathComponent("profilePicture.jpg")

        if !FileManager.default.fileExists(atPath: fileURL.path) {
            
            Storage.storage().reference().child("users/\(String(describing: id))/profile.jpg").getData(maxSize: 3 * 1024 * 1024) { data, error in
                if let error = error {
                    print("ERROR DOWNLOADING \(error)")
                } else {
                    
                    let image = UIImage(data: data!)
                    
                    do {
                        try UIImagePNGRepresentation(image!)!.write(to: fileURL)
                        print("Image Added Successfully")
                        completion()
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
    
            
    
    func getMyHeepID(completion: @escaping (Int?) -> () ) {
        
        guard let userID = Auth.auth().currentUser?.uid else {
            print("You must be logged in to perform this action")
            return
        }
        
        ref.child("users/\(userID)/profile").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            completion(value?["heepID"] as? Int? ?? nil)
            
        }) { (error) in
            print(error)
            return
        }
    }
    
    func detachObserver(referencePath: String) {
        let thisReference = ref.child(referencePath)
        thisReference.removeAllObservers()
    }
    
    func watchGroupPerspectivesForPlace(placeID: Int, reset: @escaping () -> (), completion: @escaping (GroupPerspective) -> ()) -> String? {
        
        guard let userID = Auth.auth().currentUser?.uid else {
            print("You must be logged in to perform this action")
            return nil
        }
        
        let refPath = "users/\(userID)/groups"
        
        ref.child(refPath).observe(.value, with: { (snapshot) in
            
            reset()
            
            let enumerator = snapshot.children
            while let child = enumerator.nextObject() as? DataSnapshot {
                
                let value = child.value as? NSDictionary
                
                if value?["placeID"] as? Int ?? 0 == placeID {
                    
                    let context = GroupPerspective()
                    context.placeID = value?["placeID"] as? Int ?? 0
                    context.groupID = value?["groupID"] as? Int ?? 0
                    context.UILocked = value?["UILocked"] as? Bool ?? true
                    context.unassignedOffsetX = value? ["unassignedOffsetX"] as? CGFloat ?? 0
                    context.assignedOffsetX = value? ["assignedOffsetX"] as? CGFloat ?? 0
                    context.contentOffsetX = value? ["contextOffsetX"] as? CGFloat ?? 0
                    context.contentOffsetY = value? ["contextOffsetY"] as? CGFloat ?? 0
                    context.selectedControl = value? ["selectedControl"] as? Int ?? 0
                    
                    completion(context)
                }
            }
            
            
        }) { (error) in
            print(error)
            return
        }
        
        return refPath

    }
    
    func watchGroupContext(groupID: Int, completion: @escaping (GroupPerspective) -> ()) -> String? {
        
        guard let userID = Auth.auth().currentUser?.uid else {
            print("You must be logged in to perform this action")
            return nil
        }
        
        let refPath = "users/\(userID)/groups/\(String(describing: groupID))"
        
        ref.child(refPath).observe(.value, with: { (snapshot) in
            
            
            let value = snapshot.value as? NSDictionary
            
            let context = GroupPerspective()
            
            context.placeID = value?["placeID"] as? Int ?? 0
            context.groupID = value?["groupID"] as? Int ?? 0
            context.UILocked = value?["UILocked"] as? Bool ?? true
            context.unassignedOffsetX = value? ["unassignedOffsetX"] as? CGFloat ?? 0
            context.assignedOffsetX = value? ["assignedOffsetX"] as? CGFloat ?? 0
            context.contentOffsetX = value? ["contextOffsetX"] as? CGFloat ?? 0
            context.contentOffsetY = value? ["contextOffsetY"] as? CGFloat ?? 0
            context.selectedControl = value? ["selectedControl"] as? Int ?? 0
            
            completion(context)
            
            
        }) { (error) in
            print(error)
            return
        }
        
        return refPath
        
    }
    
    func getGroup(context: GroupPerspective, completion: @escaping (Group) -> () ) {
        
        
        ref.child("groups/\(String(describing:context.groupID))").observe(.value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            let group = Group()
            group.placeID = value?["placeID"] as? Int ?? 0
            group.name = value?["name"] as? String ?? "empty"
            group.groupID = value?["groupID"] as? Int ?? 0
            
            completion(group)
            
        }) { (error) in
            print(error)
            return
        }
    }
    
    func watchGroup(context: GroupPerspective, completion: @escaping (Group) -> () ) -> String {
        
        let refPath = "groups/\(String(describing:context.groupID))"
        
        ref.child(refPath).observe(.value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            let group = Group()
            group.placeID = value?["placeID"] as? Int ?? 0
            group.name = value?["name"] as? String ?? "empty"
            group.groupID = value?["groupID"] as? Int ?? 0
            
            completion(group)
            
        }) { (error) in
            print(error)
            return
        }
        
        return refPath
    }
    
    func watchAllMyControls(completion: @escaping (Int) -> () ) -> String? {
        
        guard let userID = Auth.auth().currentUser?.uid else {
            print("You must be logged in to perform this action")
            return nil
        }
        
        let refPath = "users/\(userID)/controls"
        
        ref.child(refPath).observe(.value, with: { (snapshot) in
            
            let enumerator = snapshot.children
            
            while let child = enumerator.nextObject() as? DataSnapshot {
                
                if let id = Int(child.key) {
                    completion(id)
                }
            }
            
            
        }) { (error) in
            print(error)
            return
        }
        
        return refPath
    }
    
    func watchControl(controlID: Int, completion: @escaping (DeviceControl) -> () ) -> String? {
        
        let refPath = "controls/\(String(describing: controlID))"
        
        ref.child(refPath).observe(.value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            let control = DeviceControl()
            
            control.groupID = value?["groupID"] as? Int ?? 0
            control.controlDirection = value?["controlDirection"] as? Int ?? 0
            control.controlID = value?["controlID"] as? Int ?? 0
            control.controlName = value?["controlName"] as? String ?? ""
            control.controlType = value?["controlType"] as? Int ?? 0
            control.deviceID = value?["deviceID"] as? Int ?? 0
            control.editX = value?["editX"] as? CGFloat ?? 0
            control.editY = value?["editY"] as? CGFloat ?? 0
            control.lastOnValue = value?["lastOnValue"] as? Int ?? 0
            control.rotation = value?["rotation"] as? CGFloat ?? 0
            control.scale = value?["scale"] as? CGFloat ?? 0
            control.groupID = value?["groupID"] as? Int ?? 0
            control.uniqueID = value?["uniqueID"] as? Int ?? 0
            control.valueCurrent = value?["lastOnValue"] as? Int ?? 0
            control.valueLow = value?["valueLow"] as? Int ?? 0
            control.valueHigh = value?["valueHigh"] as? Int ?? 0
            
            completion(control)
            
            
        }) { (error) in
            print(error)
            return
        }
        
        return refPath
    }
}

