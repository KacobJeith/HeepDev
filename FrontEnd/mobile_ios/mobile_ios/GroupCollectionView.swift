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
        
        cell.backgroundColor = getRandomColor()
        
        let title = UILabel()
        title.text = thisPlace.groups[indexPath.row].name.uppercased()
        title.numberOfLines = 0
        title.sizeToFit()
        title.textColor = .white
        title.font = UIFont.boldSystemFont(ofSize: 30.0)
        title.textAlignment = .center
        title.tag = indexPath.row
        //title.adjustsFontSizeToFitWidth = true
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