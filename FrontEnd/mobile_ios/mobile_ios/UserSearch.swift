//
//  UserFinder.swift
//  mobile_ios
//
//  Created by Jacob on 6/30/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import RealmSwift


class UserSearch: UIViewController {
    
    var collectionView: UICollectionView!
    var allUsers: [User] = []
    var thisDevice = Device()
    
    convenience init(device: Device) {
        self.init()
        
        thisDevice = device
        populateAllUsers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupModalViewBackdrop()
        setupSearchSection()
    }
    
    func populateAllUsers() {
        
        let realm = try! Realm(configuration: configPublicSync)
        allUsers = realm.objects(User.self).toArray()
        
    }
    
    func setupModalViewBackdrop() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(exitSearch))
        self.view.addGestureRecognizer(tap)

    }
    
    func setupSearchSection() {
        let searchSection = UIView(frame: CGRect(x: 0,
                                                 y: self.view.bounds.maxY - 150,
                                                 width: self.view.bounds.width,
                                                 height: 150))
        searchSection.backgroundColor = .white
        searchSection.addSubview(setupCollectionView())
        self.view.addSubview(searchSection)
        
    }
    
    
}

extension UserSearch: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func setupCollectionView() -> UIView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        layout.itemSize = CGSize(width: 100, height: 130)
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        collectionView = UICollectionView(frame: CGRect(x: 0,y: 0,width: screenWidth, height: 150) , collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.backgroundColor = .white
        collectionView.contentOffset = CGPoint(x: 0, y: 0)
        
        return collectionView
        
    }
    
    // MARK: UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let realm = try! Realm(configuration: configPublicSync)
        
        return realm.objects(User.self).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath as IndexPath) as UICollectionViewCell
        
        let realm = try! Realm(configuration: configUser)
        let myID = realm.objects(User.self).first?.heepID
        
        if allUsers[indexPath.row].heepID == myID {
            cell.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            return cell
        }
        
        let bigWhiteBackground = UIView()
        bigWhiteBackground.backgroundColor = .white
        bigWhiteBackground.frame = cell.bounds
        
        cell.addSubview(bigWhiteBackground)
        cell.addSubview(generateUserCard(frame: cell.bounds, userID: allUsers[indexPath.row].heepID))
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(selectUser))
        cell.addGestureRecognizer(tap)
        cell.tag = allUsers[indexPath.row].heepID
        
        return cell
    }
    
    
    func selectUser(gesture: UITapGestureRecognizer) {
        print("SELECTED \(gesture.view?.tag)")
        
        let alert = UIAlertController(title: "Select User?",
                                      message: "Are you sure you want to grant access to this user?",
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
            print("ADD")
            
            grantPermissionToOtherUser(deviceID: self.thisDevice.deviceID, userID: (gesture.view?.tag)!)
            self.exitSearch()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { action in
            print("DONT ADD")
            self.exitSearch()
        }))
        
        present(alert, animated: false, completion: nil)

        
        
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            
        }
        
    }
    
    func exitSearch() {
        self.dismiss(animated: false)
    }
    
    
}
