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
    var notificationTokenList = [NotificationToken?]()
    
    var thisBSSID: String = ""
    var thisGroup: GroupPerspective
    
    init(groupID: Int, groupName: String) {
        
        if let context = database().getGroupContext(groupID: groupID) {
            thisGroup = context
        } else {
            print("FAILED TO LOAD CONTEXT")
            thisGroup = GroupPerspective()
        }
        
        super.init(style: UITableViewStyle.plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initNotifications()
        
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
    
    func initNotifications() {
        let notificationTokenControls = database().watchControls {
            self.tableView.reloadData()
        }
        
        let notificationTokenVertices = database().watchVertices {
            self.tableView.reloadData()
        }
        
        let notificationTokenGroupContext = database().watchGroupCotext(groupID: thisGroup.groupID) {
            self.tableView.reloadData()
        }
        
        let notificationTokenGroup = database().watchGroup(groupID: thisGroup.groupID) {
            self.tableView.reloadData()
        }
        
        notificationTokenList.append(notificationTokenGroup)
        notificationTokenList.append(notificationTokenGroupContext)
        notificationTokenList.append(notificationTokenControls)
        notificationTokenList.append(notificationTokenVertices)
        
    }
    
    deinit{
        for token in notificationTokenList {
            token?.stop()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        for token in notificationTokenList {
            token?.stop()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.initNotifications()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.row {
        case 0 :
            
            return UnassignedControlCollection(groupID: thisGroup.groupID)
            
        case 1 :
            
            let bounds = self.navigationController!.navigationBar.bounds
            
            let editFrame = CGRect(x: 0,
                                   y: 0,
                                   width: self.view.frame.width,
                                   height: self.view.frame.height - 200 - bounds.height)
            
            let cell = VertexEditCell(cellFrame: editFrame,
                                      groupID: thisGroup.groupID)
            
            cell.parentTable = self
            
            cell.addSubview(drawVertexToggleButton())
            
            return cell
            
        case 2 :
            
            return GroupControlEdit(groupID: thisGroup.groupID)
            
        default : break
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
        
        guard let groupOriginal = database().getGroup(context: thisGroup) else {
            print("Failed to load original group before saving image")
            return
        }
        
        let groupUpdate = Group(value: groupOriginal)
        groupUpdate.imageData = UIImageJPEGRepresentation(image, 0.5)! as NSData
        
        database().updateGroup(update: groupUpdate)
            
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
        
        
        vertexToggle.backgroundColor = getModeColor(thisGroup: thisGroup, highlight: true)
        modeLabel.text = getModeText(thisGroup: thisGroup)
        
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
        
        print("Toggle Lock Icon")
        let update = GroupPerspective(value: thisGroup)
        update.UILocked = !thisGroup.UILocked
        
        database().updateGroupContext(update: update)
        
    }
    
    func reloadView() {
        
//        self.loadView()
        self.viewDidLoad()
    }
    
    func searchForHeepDevices() {
        print("Searching...")
        HeepConnections().SearchForHeepDeviecs()
        
    }
    
    
}
