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
        /*
        let realm = try! Realm(configuration: config)
        notificationToken = realm.addNotificationBlock { [unowned self] note, realm in
            //self.thisPlace = realm.object(ofType: Place.self, forPrimaryKey: self.thisPlace.bssid)!
            print("Detected Changes")
        }*/
        
        self.title = thisPlace.name + " Groups"
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.bounds.width/2 - 20, height: self.view.bounds.width/2 - 20)
        
        self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.backgroundColor = UIColor.white
        self.view.addSubview(collectionView!)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addNewGroupToThisPlace))

        
        
        let search = UIBarButtonItem(barButtonSystemItem: .refresh,
                                     target: self,
                                     action: #selector(searchForHeepDevices))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                     target: nil,
                                     action: nil)
        
        self.toolbarItems = [spacer, search, spacer]

        
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
        
        let title = UILabel()
        title.text = thisPlace.groups[indexPath.row].name
        title.frame = cell.bounds
        title.backgroundColor = getRandomColor()
        title.textColor = .white
        title.textAlignment = .center
        title.tag = indexPath.row
        title.adjustsFontSizeToFitWidth = true
        title.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(openGroupView))
        tap.numberOfTapsRequired = 1
        title.addGestureRecognizer(tap)
        
        cell.addSubview(title)

        
        
        return cell
    }

}

extension GroupCollectionView {
    
    
    func openGroupView(recognizer: UITapGestureRecognizer) {
        print("Open edit Group View")
        print(thisPlace.groups[(recognizer.view?.tag)!].name)
        
        let editRoomView = EditRoomView(bssid: thisPlace.bssid)
        navigationController?.pushViewController(editRoomView, animated: true)
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
    
    func reloadView() {
        
        self.loadView()
        self.viewDidLoad()
    }
}
