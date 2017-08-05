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
    var colors = [UIColor]()
    var placeNames = [Int : String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initRealmNotification()
        self.setupNavBar()
        
        addPlaces()
    }
    
    func setupNavBar() {
        self.title = "My Heep Zones"
        self.view.backgroundColor = .white
        self.navigationController?.isToolbarHidden = false
        
        let addPlace = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPlaceToDatabase))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let search = UIBarButtonItem(title: "Search For Devices",
                                     style: .plain,
                                     target: self,
                                     action: #selector(searchForHeepDevices))
        
        let info = UIBarButtonItem(barButtonSystemItem: .organize,
                                   target: self,
                                   action: #selector(openDeviceTable))
        
        self.navigationItem.rightBarButtonItem = getActiveUserIcon()
        
        self.toolbarItems = [addPlace, spacer, search, spacer, info]
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
        
        let perspectives = realm.objects(PlacePerspective.self)
        
        for perspective in perspectives {
            
            let thisPlaceRealm = try! Realm(configuration: getPlaceConfiguration(path: perspective.realmPath))
            
            if let place = thisPlaceRealm.objects(Place.self).first {
                
                self.drawPlace(place: place, perspective: perspective)
                
            } else {
                
                asyncOpenPlace(perspective: perspective)
                print("Could not find any places at this realm config")
            }
        
        }
    }
    
    func asyncOpenPlace(perspective: PlacePerspective) {
        openRealmAsync(config: getPlaceConfiguration(path: perspective.realmPath), callback: {
            let thisPlaceRealm = try! Realm(configuration: getPlaceConfiguration(path: perspective.realmPath))
            
            if let place = thisPlaceRealm.objects(Place.self).first {
                
                self.drawPlace(place: place, perspective: perspective)
                
            }
        })
    }
    
    
    func addPlaceToDatabase() {
        database().createNewPlace()
        
    }
 
    func drawPlace(place: Place, perspective: PlacePerspective) {
        
        placeNames[place.placeID] = place.name
        
        let diameter = CGFloat(100 + 10*perspective.numDevices)
        let adjustedX = perspective.x - diameter/2
        let adjustedY = perspective.y - diameter/2
        
        let button = UIButton(frame: CGRect(x: adjustedX, y: adjustedY, width: diameter, height: diameter))
        button.backgroundColor = perspective.numDevices == 0 ? .lightGray : getRandomColor()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.setTitle("  " + place.name + "  ", for: [])
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.tag = place.placeID
        
        self.view.addSubview(button)
        
        
        let pan = UIPanGestureRecognizer(target: self,
                                         action: #selector(drag))
        
        button.addGestureRecognizer(pan)
        
        button.addTarget(self,
                         action: #selector(enterPlace),
                         for: UIControlEvents.primaryActionTriggered)
    }
    
    func enterPlace(sender: UIButton) {
        
        
        guard let name = placeNames[sender.tag] else {
            print("Bouncing...couldn't find the name")
            return
        }
        
        print("entering \(name)")
        
        let groupView = GroupCollectionView(placeID: sender.tag,
                                            placeName: name)
        
        navigationController?.pushViewController(groupView, animated: false)
        
        
    }
    
    func drag(gesture: UIPanGestureRecognizer) {
        
        switch gesture.state {
        case .began :
            
            findPanningPlace(gesture: gesture)
            
        case .changed :
            
            if activelyPanning != Int() {
                let translation = CGAffineTransform(translationX: gesture.translation(in: self.view).x,
                                                    y: gesture.translation(in: self.view).y)
                
                (self.view.viewWithTag(activelyPanning))!.transform = translation
                
            }
            
        case .ended :
            
            if activelyPanning != Int(){
                
                let realm = try! Realm(configuration: configUser)
                let thisPlace = realm.object(ofType: PlacePerspective.self, forPrimaryKey: gesture.view?.tag)
                
                try! realm.write {
                    thisPlace?.x = (thisPlace?.x)! + gesture.translation(in: self.view).x
                    thisPlace?.y = (thisPlace?.y)! + gesture.translation(in: self.view).y
                }
                
                
                self.reloadView()
                
            }
            
            activelyPanning = Int()
            
            
        default : break
        }
        
    }
    
    func findPanningPlace(gesture: UIPanGestureRecognizer) {
        for key in placeNames.keys {
            
            let activelyPanningPlace = self.view.viewWithTag(key)
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
    
    func initRealmNotification() {
        let realm = try! Realm(configuration: configUser)
        let places = realm.objects(PlacePerspective.self)
        
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
        navigationController?.pushViewController(AccountView(), animated: false)
    }
    
    func getActiveUserIcon() -> UIBarButtonItem {
        let realm = try! Realm(configuration: configUser)
        let myID = realm.objects(User.self).first?.heepID
        
        var userImage = #imageLiteral(resourceName: "female")
        
        if myID != nil {
            
            userImage = myImage(userID: myID!)
        }        
        
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
    
    func openDeviceTable() {
        print("Open Active Device Table View")
        
        let seeAllActiveDevices = DeviceTableViewController(activeOnly: true)
        navigationController?.pushViewController(seeAllActiveDevices, animated: true)
    }
}
