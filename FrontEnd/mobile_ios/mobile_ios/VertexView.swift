//
//  VertexView
//  mobile_ios
//
//  Created by Jacob Keith on 5/11/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import RealmSwift
import NotificationCenter

class VertexView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let realm = try! Realm(configuration: config)
    
    var devices = List<Device>()
    var placeBSSID = String()
    var selectedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isToolbarHidden = false
        NotificationCenter.default.post(NSNotification(name: NSNotification.Name(rawValue: "segue"), object: nil) as Notification)
        self.title = "Vertex Configuration"
        self.view.backgroundColor = .white
        let reload = UIBarButtonItem(barButtonSystemItem: .refresh,
                                     target: self,
                                     action: #selector(reloadView))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(importPicture))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        self.toolbarItems = [spacer, reload, spacer]
        
        getImage()
        
        addDevices()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    func displayBackgroundImage() {
        print(selectedImage)
        
        
        
        
        
        let data = try? Data(contentsOf: selectedImage.absoluteURL!)
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.image = UIImage(data: data!)
        imageView.contentMode = .scaleAspectFit
        self.view.addSubview(imageView)
        
        /*
        let data = try? Data(contentsOf: selectedImage as NSURL)
        if (data != nil) {
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.image = UIImage(data: data!)
            imageView.contentMode = .scaleAspectFit
            self.view.addSubview(imageView)
        }*/
        
    }*/
    
    
    func addDevices() {
        //print(devices)
        
        
        for device in devices {
            drawDevice(device: device)
        }
        
    }
    
    func drawDevice(device: Device) {
        let image = UIImage(named: device.iconName) as UIImage?
        let deviceSprite = UIButton(frame: CGRect(x: 100, y: 100, width: 60, height: 60))
        deviceSprite.setBackgroundImage(image, for: [])
        deviceSprite.contentMode = .scaleAspectFit
        deviceSprite.layer.cornerRadius = 0.5 * deviceSprite.bounds.size.width
        deviceSprite.clipsToBounds = true

        
        deviceSprite.addTarget(self,
                             action: #selector(drag),
                             for: [UIControlEvents.touchDragInside,
                                   UIControlEvents.touchDragOutside,
                                   UIControlEvents.touchDragExit])
        
        self.view.addSubview(deviceSprite)
    }
    
    func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        saveImageDocumentDirectory()
        
        //selectedImage = info["UIImagePickerControllerReferenceURL"]! as! NSURL
        //print(selectedImage)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func saveImageDocumentDirectory(){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(placeBSSID + ".jpg")
        
        let imageData = UIImageJPEGRepresentation(selectedImage, 0.5)
        fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
    }
    
    func getImage(){
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(placeBSSID + ".jpg")
        if fileManager.fileExists(atPath: imagePath){
            let imageView = UIImageView(frame: self.view.bounds)
            imageView.image = UIImage(contentsOfFile: imagePath)
            imageView.contentMode = .scaleAspectFit
            self.view.addSubview(imageView)
            
        }else{
            print("No Image")
        }
    }
    
    func drag(control: UIControl, event: UIEvent) {
        
        
        if let center = event.allTouches?.first?.location(in: self.view) {
            control.center = center
        }
    }
    
    func reloadView() {
        
        self.loadView()
        self.viewDidLoad()
    }
    
    
}
