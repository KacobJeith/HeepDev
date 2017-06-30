//
//  UserFinder.swift
//  mobile_ios
//
//  Created by Jacob on 6/30/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import RealmSwift


class UserSearch: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionView: UICollectionView!
    
//    convenience init() {
//        self.init()
//        
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainView = UIView()
        
        mainView.frame = UIScreen.main.bounds
        mainView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(exitSearch))
        mainView.addGestureRecognizer(tap)
        
        self.view.addSubview(mainView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        layout.itemSize = CGSize(width: 80, height: 80)
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        collectionView = UICollectionView(frame: CGRect(x: 0,y: 0,width: screenWidth,height: 100) , collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.backgroundColor = .white
        collectionView.contentOffset = CGPoint(x: 0, y: 0)
        
        //self.addSubview(collectionView)

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
        
        let bigWhiteBackground = UIView()
        bigWhiteBackground.backgroundColor = .white
        bigWhiteBackground.frame = cell.bounds
        
        cell.addSubview(bigWhiteBackground)
        
        return cell
    }
    
}

extension UserSearch {
    
    func selectUser(sender: UIButton) {
        
        
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
