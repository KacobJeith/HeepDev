//
//  GroupCollectionView.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/18/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class GroupCollectionView: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var thisPlace: Place = Place()
    var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        self.title = thisPlace.name + " Groups"
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.width/2 - 40, height: self.view.frame.height/3 - 60)
        
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.collectionView?.backgroundColor = UIColor.white
        self.view.addSubview(collectionView!)
        
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
        cell.backgroundColor = UIColor.lightGray
        let title = UILabel()
        title.text = thisPlace.groups[indexPath.row].name
        title.frame = cell.bounds
        title.textColor = .white
        title.textAlignment = .center
        
        title.adjustsFontSizeToFitWidth = true
        
        cell.addSubview(title)

        
        
        
        // Configure the cell
        
        return cell
    }

}
