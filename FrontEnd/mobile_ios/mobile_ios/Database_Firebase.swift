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
        
        guard let userID = Auth.auth().currentUser?.uid else {
            print("No Firebase User Logged In")
            return
        }
        
        ref.child("devices/\(String(describing: device.deviceID))/identity").setValue(device.toDict())
        ref.child("users/\(userID)/devices/\(String(describing: device.deviceID))").setValue([String(describing: device.deviceID): true])
        
    }
    
    func writeDeviceControl(control: DeviceControl) {
        
        updateDeviceControl(control: control)
    }
    
    func updateDeviceControl(control: DeviceControl) {
        
        ref.child("devices/\(String(describing: control.deviceID))/controls/\(String(describing: control.controlID))").setValue(control.toDict())
        
    }
    
    func writeVertex(vertex: Vertex) {
        
        guard let txDeviceID = vertex.tx?.deviceID else {
            print("no tx set")
            return
        }
        
        ref.child("devices/\(String(describing: txDeviceID))/vertices/\(String(describing: vertex.vertexID))").setValue(
            ["vertexID": vertex.vertexID,
             "txDeviceID": (vertex.tx?.deviceID)!,
             "txControlID": (vertex.tx?.controlID)!,
             "rxDeviceID": (vertex.rx?.deviceID)!,
             "rxControlID": (vertex.rx?.controlID)!]
        )
    }
    
    func updateDeviceNameAndIcon(device: Device, deviceName: String, iconName: String) {
        print("Updating name and icon")
        
        let updates = ["/devices/\(device.deviceID)/identity/name": deviceName,
                       "/devices/\(device.deviceID)/identity/iconName": iconName]
        
        ref.updateChildValues(updates)
        
    }
    
    func flushControlVertices(controlUniqueID: Int) {
        
        
        ref.child("vertices").queryOrdered(byChild:"txID").queryEqual(toValue: controlUniqueID).observe(.value, with: { snapshot in
            
            print("SNAPSHOT: \(snapshot)")
            snapshot.ref.removeValue()
            
        })
    }
    
    func deleteVertex(vertex: Vertex) {
        print("Firebase Deleting Vertex")
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
    
    func watchAllMyDevices(completion: @escaping (Int) -> () ) -> String? {
        
        guard let userID = Auth.auth().currentUser?.uid else {
            print("You must be logged in to perform this action")
            return nil
        }
        
        let refPath = "users/\(userID)/devices"
        
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
    
    func watchControlsForDevice(deviceID: Int, reset: @escaping () -> (), completion: @escaping (DeviceControl) -> ()) -> String? {
        
        guard let userID = Auth.auth().currentUser?.uid else {
            print("You must be logged in to perform this action")
            return nil
        }
        
        let refPath = "devices/\(String(describing: deviceID))/controls"
        
        ref.child(refPath).observe(.value, with: { (snapshot) in
            
            reset()
            
            let enumerator = snapshot.children
            
            while let child = enumerator.nextObject() as? DataSnapshot {
                
                let value = child.value as? NSDictionary
                
                let control = self.interpretControl(controlDict: value)
                
                completion(control)

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
            
            let control = self.interpretControl(controlDict: value)
            
            completion(control)
            
            
        }) { (error) in
            print(error)
            return
        }
        
        return refPath
    }
    
    func getControl(deviceID: Int, controlID: Int, completion: @escaping(DeviceControl) -> () ) {
        let refPath = "devices/\(String(describing: deviceID))/controls/\(String(describing: controlID))"
        
        ref.child(refPath).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            
            let control = self.interpretControl(controlDict: value)
            
            completion(control)
            
            
        }) { (error) in
            print(error)
            return
        }
    }

    func watchDevice(deviceID: Int,
                     reset: @escaping () -> (), 
                     identity: @escaping (Device) -> (),
                     controls: @escaping (DeviceControl) -> (),
                     vertices: @escaping (Vertex) -> ()) -> String {
        
        let refPath = "devices/\(String(describing: deviceID))"
        
        ref.child(refPath).observe(.value, with: { (snapshot) in
            
            reset()
            
            let enumerator = snapshot.children
            
            while let child = enumerator.nextObject() as? DataSnapshot {
                if child.key == "identity" {
                    
                    let identityDictionary = child.value as? NSDictionary
                    
                    let device = self.interpretDevice(identityDictionary: identityDictionary)
                    
                    identity(device)
                    
                } else if child.key == "controls" {
                    
                    let controlEnumerator = child.children
                    
                    while let controlChild = controlEnumerator.nextObject() as? DataSnapshot {
                        let controlDict = controlChild.value as? NSDictionary
                        
                        let control = self.interpretControl(controlDict: controlDict)
                        
                        controls(control)
                    }
                    
                } else if child.key == "vertices" {
                    
                    let vertexEnumerator = child.children
                    
                    while let vertexChild = vertexEnumerator.nextObject() as? DataSnapshot {
                        let value = vertexChild.value as? NSDictionary
                        
                        let vertex = Vertex()
                        vertex.vertexID = value?["vertexID"] as? String ?? ""
                        
                        let txDeviceID = value?["txDeviceID"] as? Int ?? 0
                        let txControlID = value?["txControlID"] as? Int ?? 0
                        let rxDeviceID = value?["rxDeviceID"] as? Int ?? 0
                        let rxControlID = value?["rxControlID"] as? Int ?? 0
                        
                        self.getControl(deviceID: txDeviceID, controlID: txControlID) { txControl in
                            
                            vertex.tx = txControl
                            
                            self.getControl(deviceID: rxDeviceID, controlID: rxControlID) { rxControl in
                                
                                vertex.rx = rxControl
                                
                                vertices(vertex)
                            }
                        }
                    }
                }
            }
        })
        
        return refPath
    }
    
    func interpretDevice(identityDictionary: NSDictionary?) -> Device {
        
        let device = Device()
        device.deviceID = identityDictionary?["deviceID"] as? Int ?? 0
        device.active = identityDictionary?["active"] as? Bool ?? false
        device.authorizedUsers = identityDictionary?["authorizedUsers"] as? String ?? ""
        device.humanAdmin = identityDictionary?["humanAdmin"] as? Int ?? 0
        device.iconName = identityDictionary?["iconName"] as? String ?? ""
        device.ipAddress = identityDictionary?["ipAddress"] as? String ?? ""
        device.name = identityDictionary?["name"] as? String ?? ""
        device.version = identityDictionary?["version"] as? Int ?? 0
        
        return device
    }
    
    func interpretControl(controlDict: NSDictionary? ) -> DeviceControl {
        let control = DeviceControl()
        
        control.groupID = controlDict?["groupID"] as? Int ?? 0
        control.controlDirection = controlDict?["controlDirection"] as? Int ?? 0
        control.controlID = controlDict?["controlID"] as? Int ?? 0
        control.controlName = controlDict?["controlName"] as? String ?? ""
        control.controlType = controlDict?["controlType"] as? Int ?? 0
        control.deviceID = controlDict?["deviceID"] as? Int ?? 0
        control.editX = controlDict?["editX"] as? CGFloat ?? 0
        control.editY = controlDict?["editY"] as? CGFloat ?? 0
        control.lastOnValue = controlDict?["lastOnValue"] as? Int ?? 0
        control.rotation = controlDict?["rotation"] as? CGFloat ?? 0
        control.scale = controlDict?["scale"] as? CGFloat ?? 0
        control.groupID = controlDict?["groupID"] as? Int ?? 0
        control.uniqueID = controlDict?["uniqueID"] as? Int ?? 0
        control.valueCurrent = controlDict?["lastOnValue"] as? Int ?? 0
        control.valueLow = controlDict?["valueLow"] as? Int ?? 0
        control.valueHigh = controlDict?["valueHigh"] as? Int ?? 0
        
        return control
    }
    
}

