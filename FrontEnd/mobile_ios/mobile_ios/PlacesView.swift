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
    var notificationToken: NotificationToken? = nil
    
    var activelyPanning = Int()
    var searchTimeout = 4
    var bssids = [String]()
    var colors = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initRealmNotification()
        
        self.title = "My Heep Zones"
        self.view.backgroundColor = .white
        self.navigationController?.isToolbarHidden = false
        
        let flush = UIBarButtonItem(barButtonSystemItem: .trash,
                                    target: self,
                                    action: #selector(deleteAll))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let search = UIBarButtonItem(title: "Search For Devices",
                                     style: .plain,
                                     target: self,
                                     action: #selector(searchForHeepDevices))
                
        self.navigationItem.rightBarButtonItem = getActiveUserIcon()
        
        self.toolbarItems = [flush, spacer,  search, spacer]

        addPlaces()
        //self.searchForHeepDevices()
    }
    
    
    deinit{
        notificationToken?.stop()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        notificationToken?.stop()
        self.title = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "My Heep Zones"
        self.initRealmNotification()
        self.reloadView()
        
    }
    

    func addPlaces() {
        let realm = try! Realm(configuration: configUser)
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
        let realm = try! Realm(configuration: configUser)
        
        let currentWifi = currentWifiInfo()
        let allGroups = realm.objects(Group.self)
        
        let firstGroupInPlace = Group()
        firstGroupInPlace.place = currentWifi.bssid
        firstGroupInPlace.name = "My First Room"
        if allGroups.count > 0 {
            
            firstGroupInPlace.id = allGroups.max(ofProperty: "id")! + 1
        } else {
            firstGroupInPlace.id = 1
        }
        
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
        let realm = try! Realm(configuration: configUser)
        let enterPlace = realm.object(ofType: Place.self, forPrimaryKey: bssids[sender.tag - 1])
        
        print("entering \(String(describing: enterPlace?.name))")

        let groupView = GroupCollectionView()
        groupView.thisPlace = enterPlace!
        navigationController?.pushViewController(groupView, animated: false)
        
        
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
                
                let realm = try! Realm(configuration: configUser)
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
        let realm = try! Realm(configuration: configUser)
        try! realm.write {
         
            realm.deleteAll()
            
         }
        
        self.loadView()
        self.viewDidLoad()
    }
}

extension PlacesView {
    
    func reloadView() {
        
        print("Ran reloadView")
        self.loadView()
        self.viewDidLoad()
    }
    
    func searchForHeepDevices() {
        HeepConnections().SearchForHeepDeviecs()
        
    }
        
    func launchSearch() {
        print("Searching...")
        HeepConnections().SearchForHeepDeviecs()
    }
    
    func initRealmNotification() {
        let realm = try! Realm(configuration: configUser)
        let places = realm.objects(Place.self)
        
        notificationToken = places.addNotificationBlock { [weak self] (changes: RealmCollectionChange) in
            
            switch changes {
            case .update:
                
                self?.reloadView()
                break
            case .error(let error):
                fatalError("\(error)")
                break
            default: break
            }
        }
        

    }
    
    func userLogin() {
        // Open modal view that gives login options
        /*
        let modalViewController = AccountView()
        modalViewController.placesView = self
        
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: false, completion: nil)
        */
        
        navigationController?.pushViewController(NavAccountView(), animated: false)
    }
    
    func getActiveUserIcon() -> UIBarButtonItem {
        let realm = try! Realm(configuration: configPublic)
        
        var userImage = UIImage(named: "female")
        /*
        if (activeUser?.icon.length)! > 0 {
            userImage = UIImage(data: (activeUser?.icon)! as Data)
        }
        */
        
        let userButton = UIButton(frame: CGRect(x: 0, y: 0,
                                                width: (navigationController?.navigationBar.bounds.height)!,
                                                height: (navigationController?.navigationBar.bounds.height)!))
        
        userButton.imageView?.contentMode = .scaleAspectFit
        userButton.setImage(userImage, for: .normal)
        userButton.layer.borderWidth = 1
        userButton.layer.borderColor = UIColor.white.cgColor
        userButton.layer.shadowColor = UIColor.lightGray.cgColor
        userButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        userButton.layer.shadowRadius = 2
        userButton.layer.cornerRadius = 0.5 * userButton.bounds.size.width
        userButton.clipsToBounds = true
        userButton.addTarget(self,
                             action: #selector(userLogin),
                             for: .primaryActionTriggered)
        
        return UIBarButtonItem(customView: userButton)
        
    }
}
