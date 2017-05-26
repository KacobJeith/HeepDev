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
    var notificationTokenControls: NotificationToken? = nil
    var notificationTokenGroup: NotificationToken? = nil
    var notificationTokenVertices: NotificationToken? = nil
    
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
        
        self.initRealmNotification()
        
        
        self.title = thisGroup.name
        self.navigationController?.isToolbarHidden = false
        tableView.alwaysBounceVertical = false
        let search = UIBarButtonItem(title: "Search For Devices",
                                     style: .plain,
                                     target: self,
                                     action: #selector(searchForHeepDevices))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera,
                                                            target: self,
                                                            action: #selector(importPicture))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        self.toolbarItems = [spacer, search, spacer]
    }
    
    
    deinit{
        notificationTokenControls?.stop()
        notificationTokenGroup?.stop()
        notificationTokenVertices?.stop()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        notificationTokenControls?.stop()
        notificationTokenGroup?.stop()
        notificationTokenVertices?.stop()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if (indexPath.row == 0) {
            
            let cell = UnassignedControlCollection(bssid: thisBSSID,
                                                   thisGroup: thisGroup,
                                                   indexPath: indexPath)
            
            return cell
            
        } else if (indexPath.row == 1) {
            
            let bounds = self.navigationController!.navigationBar.bounds
            
            let editFrame = CGRect(x: 0,
                                   y: 0,
                                   width: self.view.frame.width,
                                   height: self.view.frame.height - 200 - bounds.height)
            
            let cell = VertexEditCell(bssid: thisBSSID,
                                      cellFrame: editFrame,
                                      thisGroup: thisGroup,
                                      indexPath: indexPath)
            
            
            cell.addSubview(drawVertexToggleButton())
            
            return cell
            
        } else if (indexPath.row == 2) {
            let cell = GroupControlEdit(bssid: thisBSSID,
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
    
    func drawVertexToggleButton() -> UIView {
        let modePuck = UIView()
        modePuck.backgroundColor = .clear
        let imageSpaceHeight = self.view.frame.height - 200 - self.navigationController!.navigationBar.bounds.height
        modePuck.frame = CGRect(x: self.view.frame.width - 70,
                                    y: imageSpaceHeight - 70,
                                    width: 60,
                                    height: 60)
        
        let innerElementFrame = CGRect(x: 0,
                                       y: 0,
                                       width: 60,
                                       height: 60)
        
        
        
        
        let vertexToggle = UIButton()
        vertexToggle.frame = innerElementFrame
        vertexToggle.layer.cornerRadius = 0.5 * vertexToggle.bounds.size.width
        vertexToggle.layer.opacity = 0.7
        vertexToggle.layer.shadowColor = UIColor.lightGray.cgColor
        vertexToggle.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        vertexToggle.layer.shadowRadius = 0.25
        vertexToggle.layer.shadowOpacity = 0.5
        vertexToggle.clipsToBounds = true
        
        
        let modeLabel = UILabel()
        modeLabel.frame = innerElementFrame
        
        if thisGroup.selectedControl == 0 {
            
            vertexToggle.backgroundColor = UIColor.lightGray
            modeLabel.text = " Scrolling "
            
        } else if thisGroup.selectedControl == 1 {
            vertexToggle.backgroundColor = UIColor.green
            modeLabel.text = " Adding "
            
        } else if thisGroup.selectedControl == 2 {
            vertexToggle.backgroundColor = UIColor.red
            modeLabel.text = " Deleting "
        } else {
            vertexToggle.backgroundColor = UIColor.blue
            modeLabel.text = " Positioning "
        }
        
        
        modeLabel.textColor = UIColor.white
        modeLabel.adjustsFontSizeToFitWidth = true
        modeLabel.layer.shadowColor = UIColor.lightGray.cgColor
        modeLabel.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        modeLabel.layer.shadowRadius = 0.25
        modeLabel.layer.shadowOpacity = 0.5
        
        vertexToggle.addTarget(self,
                               action: #selector(toggleVertexEditState),
                               for: UIControlEvents.primaryActionTriggered)
        modePuck.addSubview(vertexToggle)
        modePuck.addSubview(modeLabel)
        
        return modePuck
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
    
    func searchForHeepDevices() {
        print("Searching...")
        HeepConnections().SearchForHeepDeviecs()
        
    }
    
    
    func initRealmNotification() {
        let watchControls = realm.objects(DeviceControl.self).filter("place = %@ AND groupsAssigned = 0", thisBSSID)
            
        notificationTokenControls = watchControls.addNotificationBlock {  [weak self] (changes: RealmCollectionChange) in
                
                switch changes {
                case .update:
                    
                    self?.tableView.reloadData()
                    break
                case .error(let error):
                    fatalError("\(error)")
                    break
                default: break
                    
                }
        }
        
        let watchVertices = realm.objects(Vertex.self)
        
        notificationTokenVertices = watchVertices.addNotificationBlock {  [weak self] (changes: RealmCollectionChange) in
            
            switch changes {
            case .update:
                
                self?.tableView.reloadData()
                break
            case .error(let error):
                fatalError("\(error)")
                break
            default: break
                
            }
        }
        
        let watchGroup = realm.object(ofType: Group.self, forPrimaryKey: thisGroup.id)!
        
        notificationTokenGroup = watchGroup.addNotificationBlock { changes in
            /* results available asynchronously here */
            switch changes {
            case .change:
                
                self.tableView.reloadData()
                break
            case .error(let error):
                fatalError("\(error)")
                break
            default: break
            }
        }
        
    }
}
