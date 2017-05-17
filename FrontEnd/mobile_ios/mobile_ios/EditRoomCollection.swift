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
    var selectedImage: UIImage = UIImage()
    
    init(bssid: String) {
        devices = Array(realm.objects(Device.self).filter("associatedPlace = %s", bssid))
        let thisPlace = realm.object(ofType: Place.self, forPrimaryKey: bssid)
        thisBSSID = bssid
        roomName = (thisPlace?.name)!
        super.init(style: UITableViewStyle.plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = roomName
        self.navigationController?.isToolbarHidden = false
        
        let reload = UIBarButtonItem(barButtonSystemItem: .refresh,
                                     target: self,
                                     action: #selector(reloadView))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(importPicture))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        self.toolbarItems = [spacer, reload, spacer]
        
        getImage()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            let cell = DeviceControlPuck()
            cell.devices = devices
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var customHeight = CGFloat(100)
        
        if (indexPath.row == 1) {
            customHeight = self.view.frame.height - 200
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
        selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        saveImageDocumentDirectory()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func saveImageDocumentDirectory(){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(thisBSSID + ".jpg")
        
        let imageData = UIImageJPEGRepresentation(selectedImage, 0.5)
        fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
    }
    
    func getImage(){
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(thisBSSID + ".jpg")
        if fileManager.fileExists(atPath: imagePath){
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.image = UIImage(contentsOfFile: imagePath)
            imageView.contentMode = .scaleAspectFit
            self.view.addSubview(imageView)
            
        }else{
            print("No Image")
        }
    }
    
}


// Utility functions
extension EditRoomView {
    
    func reloadView() {
        
        self.loadView()
        self.viewDidLoad()
    }
}
