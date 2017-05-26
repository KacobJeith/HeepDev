//
//  GroupCollectionView.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/18/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import RealmSwift


class GroupCollectionView: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var notificationToken: NotificationToken? = nil
    var thisPlace: Place = Place()
    var collectionView: UICollectionView!
    
    private let reuseIdentifier = "Cell"
    
    deinit{
        notificationToken?.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = thisPlace.name + " Groups"
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        let dimension = (self.view.bounds.width )/2 - layout.sectionInset.left - layout.sectionInset.right + 5
        layout.itemSize = CGSize(width: dimension,
                                 height: dimension)
        
        print(self.view.bounds.width)
        print(2 * dimension + 20 + 10)
        
        self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.backgroundColor = UIColor.white
        self.view.addSubview(collectionView!)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addNewGroupToThisPlace))

        let flush = UIBarButtonItem(barButtonSystemItem: .trash,
                                    target: self,
                                    action: #selector(flushGroup))
        
        let search = UIBarButtonItem(barButtonSystemItem: .refresh,
                                     target: self,
                                     action: #selector(searchForHeepDevices))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                     target: nil,
                                     action: nil)
        
        let info = UIBarButtonItem(barButtonSystemItem: .organize,
                                   target: self,
                                   action: #selector(openDeviceTable))
        
        
        self.toolbarItems = [flush, spacer, search, spacer, info]

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thisPlace.groups.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        cell.backgroundColor = getRandomColor()
        
        let title = UILabel()
        title.text = " " + thisPlace.groups[indexPath.row].name.uppercased() + " "
        title.numberOfLines = 0
        title.sizeToFit()
        title.textColor = .white
        title.font = UIFont.boldSystemFont(ofSize: 30.0)
        
        title.layer.shadowColor = UIColor.lightGray.cgColor
        title.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        title.layer.shadowOpacity = 0.5
        title.layer.shadowRadius = 0.25

        title.textAlignment = .center
        title.tag = indexPath.row
        title.isUserInteractionEnabled = true
        title.frame = cell.bounds
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(openGroupView))
        tap.numberOfTapsRequired = 1
        title.addGestureRecognizer(tap)
        
        let thisImageData = thisPlace.groups[indexPath.row].imageData
        if (thisImageData == NSData()) {
            print("empty image")
            title.backgroundColor = getRandomColor()
        } else {
            title.backgroundColor = .clear
            let image = UIImage(data: thisImageData as Data)
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.frame = cell.bounds
            cell.addSubview(imageView)
            let overlay = UIView()
            overlay.backgroundColor = UIColor.black
            overlay.alpha = 0.1
            
        }
        
        
        cell.addSubview(title)

        
        
        return cell
    }

}

extension GroupCollectionView {
    
    
    func openGroupView(recognizer: UITapGestureRecognizer) {
        print("Open edit Group View")
        print(thisPlace.groups[(recognizer.view?.tag)!].name)
        
        let editRoomView = EditRoomView(bssid: thisPlace.bssid,
                                        groupID: thisPlace.groups[(recognizer.view?.tag)!].id)
        navigationController?.pushViewController(editRoomView, animated: true)
    }
    
    func openDeviceTable() {
        print("Open Device Table View")
        
        let seeAllDevicesInPlace = DeviceTableViewController(place: thisPlace)
        navigationController?.pushViewController(seeAllDevicesInPlace, animated: true)
    }
    
    func searchForHeepDevices() {
        print("Searching...")
        HeepConnections().SearchForHeepDeviecs()
        
    }
    
    func addNewGroupToThisPlace() {
        let realm = try! Realm(configuration: config)
        let updatedThisPlace = realm.object(ofType: Place.self, forPrimaryKey: thisPlace.bssid)!
        let allGroups = realm.objects(Group.self)
        let newGroup = Group()
        newGroup.place = thisPlace.bssid
        newGroup.name = "New Room " + String(updatedThisPlace.groups.count)
        newGroup.id = allGroups.count
        
        
        try! realm.write {
            
            realm.add(newGroup)
            thisPlace.groups.append(newGroup)
        }
        
        reloadView()
    }
    
    func flushGroup() {
        let realm = try! Realm(configuration: config)
        
        
        try! realm.write {
            
            realm.delete(thisPlace.groups)
        }
        
        
        let allGroups = realm.objects(Group.self).sorted(byKeyPath: "id", ascending: false)
        
        let firstGroupInPlace = Group()
        firstGroupInPlace.place = thisPlace.bssid
        firstGroupInPlace.name = "My First Room"
        
        if allGroups.count == 0 {
            firstGroupInPlace.id = 0
        } else {
            
            firstGroupInPlace.id = (allGroups.first?.id)! + 1
        }
        print(firstGroupInPlace.id)
        
        try! realm.write {
            
            thisPlace.groups.append(firstGroupInPlace)
        }
        
        let assignedControls = realm.objects(DeviceControl.self).filter("place = %@ AND groupsAssigned = 1", thisPlace.bssid)
        
        try! realm.write {
            assignedControls.setValue(0, forKey: "groupsAssigned")
        }
        
        let devicesInPlace = realm.objects(Device.self).filter("associatedPlace = %@", thisPlace.bssid)
        
        try! realm.write {
            for device in devicesInPlace {
                for control in device.controlList {
                    
                    realm.delete(control)
                }
                
                realm.delete(device)
            }
        }
        
        
        
        reloadView()
    }
    
    func reloadView() {
        
        self.loadView()
        self.viewDidLoad()
    }
}
