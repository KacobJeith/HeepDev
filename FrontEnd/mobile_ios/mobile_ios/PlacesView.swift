//
//  PlacesView.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/11/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import RealmSwift

class PlacesView: UIViewController {
    
    let realm = try! Realm(configuration: config)
    var activelyPanning = Int()
    var bssids = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Places"
        self.view.backgroundColor = .white
        
        
        let toolbarContent = UIBarButtonItem()
        toolbarContent.title = "Delete All"
        self.navigationController?.isToolbarHidden = false
        toolbarContent.target = self
        toolbarContent.action = #selector(deleteAll)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let reload = UIBarButtonItem(barButtonSystemItem: .refresh,
                                     target: self,
                                     action: #selector(reloadView))
        self.toolbarItems = [toolbarContent, spacer, reload, spacer]

        addPlaces()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func addPlaces() {
        
        let currentWifi = currentWifiInfo()
        let thisWifiCheck = realm.objects(Place.self).filter("bssid == %s", currentWifi.bssid)
        if (thisWifiCheck.count == 0) {
            addPlaceToRealm()
        }
        
        let allPlaces = realm.objects(Place.self)
        
        for place in allPlaces {
            
            drawPlace(thisX: place.x,
                      thisY: place.y,
                      thisName: place.name,
                      numDevices: place.devices.count,
                      thisBSSID: place.bssid)
        }
        
    }
    
    
    func addPlaceToRealm() {
        let currentWifi = currentWifiInfo()
        let allGroups = realm.objects(Group.self)
        
        let firstGroupInPlace = Group()
        firstGroupInPlace.place = currentWifi.bssid
        firstGroupInPlace.name = "My First Room"
        firstGroupInPlace.id = allGroups.count
        
        let newPlace = Place()
        newPlace.ssid = currentWifi.ssid
        newPlace.bssid = currentWifi.bssid
        newPlace.name = currentWifi.ssid
        
        try! realm.write {
            
            realm.add(newPlace)
            realm.add(firstGroupInPlace)
            newPlace.groups.append(firstGroupInPlace)
        }
    }
 
    func drawPlace(thisX: CGFloat, thisY: CGFloat, thisName: String, numDevices: Int, thisBSSID: String) {
        bssids.append(thisBSSID)
        let diameter = CGFloat(100 + 10*numDevices)
        let adjustedX = thisX - diameter/2
        let adjustedY = thisY - diameter/2
        
        let button = UIButton(frame: CGRect(x: adjustedX, y: adjustedY, width: diameter, height: diameter))
        button.backgroundColor = numDevices == 0 ? .lightGray : getRandomColor()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.setTitle("  " + thisName + "  ", for: [])
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.tag = bssids.count
        self.view.addSubview(button)
        
        
        let pan = UIPanGestureRecognizer(target: self,
                                         action: #selector(drag))
        
        button.addGestureRecognizer(pan)
        
        button.addTarget(self,
                         action: #selector(enterPlace),
                         for: UIControlEvents.primaryActionTriggered)
    }
    
    func enterPlace(sender: UIButton) {
        let enterPlace = realm.object(ofType: Place.self, forPrimaryKey: bssids[sender.tag - 1])
        
        print("entering \(String(describing: enterPlace?.name))")

        let groupView = GroupCollectionView()
        groupView.thisPlace = enterPlace!
        navigationController?.pushViewController(groupView, animated: true)
        
        
    }
    
    func drag(gesture: UIPanGestureRecognizer) {
        
        if gesture.state == UIGestureRecognizerState.began {

            findPanningPlace(gesture: gesture)
            
        } else if gesture.state == UIGestureRecognizerState.changed {
            if activelyPanning != Int(){
                let translation = CGAffineTransform(translationX: gesture.translation(in: self.view).x,
                                                    y: gesture.translation(in: self.view).y)
                (self.view.viewWithTag(activelyPanning))!.transform = translation
                
            }
            
            
        } else if gesture.state == UIGestureRecognizerState.ended {
            if activelyPanning != Int(){
                
                let realm = try! Realm(configuration: config)
                let thisPlace = realm.object(ofType: Place.self, forPrimaryKey: bssids[activelyPanning - 1])
                try! realm.write {
                    thisPlace?.x = (thisPlace?.x)! + gesture.translation(in: self.view).x
                    thisPlace?.y = (thisPlace?.y)! + gesture.translation(in: self.view).y
                }
                
                
                self.reloadView()
                
            }
            
            activelyPanning = Int()
            
            
        }
        
        
        
    }
    
    func findPanningPlace(gesture: UIPanGestureRecognizer) {
        for index in 1...(bssids.count) {
            
            let activelyPanningPlace = self.view.viewWithTag(index)
            let gestureLocation = gesture.location(in: self.view)
            if activelyPanningPlace != nil {
                if (activelyPanningPlace?.frame)!.contains(gestureLocation) {
                    
                    activelyPanning = (activelyPanningPlace?.tag)!
                }
            }
            
        }
    }
    
    func deleteAll() {
        print("Deleting all Devices")
        let realm = try! Realm(configuration: config)
        try! realm.write {
         
            realm.deleteAll()
            
         }
        
        self.loadView()
        self.viewDidLoad()
    }
    

}

extension PlacesView {
    
    func reloadView() {
        
        self.loadView()
        self.viewDidLoad()
    }
}
