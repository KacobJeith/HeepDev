//
//  VertexCollection.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/16/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import RealmSwift

class EditRoomView: UITableViewController {
    
    let devices: [Device]
    let realm = try! Realm(configuration: config)
    var roomName: String = ""
    var thisBSSID: String = ""
    var thisGroup: Group
    
    init(bssid: String, groupID: Int) {
        devices = Array(realm.objects(Device.self).filter("associatedPlace = %s", bssid))
        let thisPlace = realm.object(ofType: Place.self, forPrimaryKey: bssid)
        //print(thisPlace)
        self.thisBSSID = (thisPlace?.bssid)!
        self.roomName = (thisPlace?.name)!
        thisGroup = realm.object(ofType: Group.self, forPrimaryKey: groupID)!
        print(thisGroup)
        super.init(style: UITableViewStyle.plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = roomName
        self.navigationController?.isToolbarHidden = false
        tableView.alwaysBounceVertical = false
        let reload = UIBarButtonItem(barButtonSystemItem: .refresh,
                                     target: self,
                                     action: #selector(reloadView))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(importPicture))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        self.toolbarItems = [spacer, reload, spacer]
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            let cell = UnassignedControlCollection(bssid: thisBSSID,
                                                   parentTable: tableView,
                                                   thisGroup: thisGroup,
                                                   indexPath: indexPath)
            return cell
            
        } else if (indexPath.row == 1) {
            let cell = VertexEditCell(bssid: thisBSSID,
                                      parentTable: tableView,
                                      thisGroup: thisGroup,
                                      indexPath: indexPath)
            
            
            cell.addSubview(drawVertexToggleButton())
            
            return cell
            
        } else if (indexPath.row == 2) {
            let cell = GroupControlEdit(bssid: thisBSSID,
                                        parentTable: tableView,
                                        thisGroup: thisGroup,
                                        indexPath: indexPath)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var customHeight = CGFloat(100)
        
        if (indexPath.row == 1) {
            
            let bounds = self.navigationController!.navigationBar.bounds
            customHeight = self.view.frame.height - 200 - bounds.height
        }
        
        return customHeight
    }    
    
}

// Functions related to selecting the image
extension EditRoomView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        saveImageToGroup(image: selectedImage)
        self.reloadView()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func saveImageToGroup(image: UIImage) {
        print("Saving Image")
        let imageData = UIImageJPEGRepresentation(image, 0.5)
        
        let realm = try! Realm()
        
        try! realm.write {
            thisGroup.imageData = imageData! as NSData
        }
        print(thisGroup.name)
            
    }
    
}


// Utility functions
extension EditRoomView {
    
    func drawVertexToggleButton() -> UIButton {
        let vertexToggle = UIButton()
        let imageSpaceHeight = self.view.frame.height - 200 - self.navigationController!.navigationBar.bounds.height
        vertexToggle.frame = CGRect(x: self.view.frame.width - 70,
                                    y: imageSpaceHeight - 70,
                                    width: 60,
                                    height: 60)
        vertexToggle.layer.cornerRadius = 0.5 * vertexToggle.bounds.size.width
        vertexToggle.clipsToBounds = true
        
        if thisGroup.selectedControl == 0 {
            
            vertexToggle.backgroundColor = UIColor.lightGray
            vertexToggle.setTitle("Edit", for: [])
            
        } else if thisGroup.selectedControl == 1 {
            vertexToggle.backgroundColor = UIColor.blue
            vertexToggle.setTitle("Adding", for: [])
            
        } else if thisGroup.selectedControl == 2 {
            vertexToggle.backgroundColor = UIColor.red
            vertexToggle.setTitle("Deleting", for: [])
            
        } else {
            vertexToggle.backgroundColor = UIColor.lightGray
            vertexToggle.setTitle("Back", for: [])
        }
        
        
        vertexToggle.setTitleColor(UIColor.white, for: UIControlState.normal)
        vertexToggle.titleLabel?.adjustsFontSizeToFitWidth = true
        
        vertexToggle.addTarget(self,
                               action: #selector(toggleVertexEditState),
                               for: UIControlEvents.primaryActionTriggered)
        
        return vertexToggle
    }
    
    func toggleVertexEditState() {
        print("Toggle Vertex Edit")
        
        let realm = try! Realm(configuration: config)
        
        try! realm.write {
            if thisGroup.selectedControl <= 1 {
                
                thisGroup.selectedControl += 1
                
            } else {
                thisGroup.selectedControl = 0
                
            }
        }
        
    }
    
    func reloadView() {
        
        self.loadView()
        self.viewDidLoad()
    }
}
