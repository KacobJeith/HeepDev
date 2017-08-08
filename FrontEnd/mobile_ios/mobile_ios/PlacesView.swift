//
//  PlacesView.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/11/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import Firebase

class PlacesView: UIViewController {
    
    var activelyPanning = Int()
    var searchTimeout = 4
    var colors = [UIColor]()
    var placeNames = [Int : String]()
    var places = [Place]()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.initNotification()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VIEWDIDLOAD")
        self.addPlaces()
        self.setupNavBar()
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
        
        ref.child("users/\((Auth.auth().currentUser?.uid)!)/places").removeAllObservers()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        ref.child("users/\((Auth.auth().currentUser?.uid)!)/places").removeAllObservers()
        
        self.title = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "My Heep Zones"
        //self.addPlaces()
        
    }
    
    func addPlaces() {
        
        database().getPlaceContexts(completion: { (context) in
            
            database().getPlace(context: context, completion: { (place) in
                
                self.drawPlace(place: place, perspective: context)
            })
        })
    }
    
    func initNotification() {
        database().watchPlaces(completion: {
            self.reloadView()
        })
    }
    
    func addPlaceToDatabase() {
        
        database().createNewPlace()
        
    }
 
    func drawPlace(place: Place, perspective: PlacePerspective) {
        
        if let viewWithTag = self.view.viewWithTag(place.placeID) {
            
            viewWithTag.removeFromSuperview()
        }
        
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
        
        print(button.tag)
        
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
                
                
                guard let tag = gesture.view?.tag else {
                    print("Couldn't get view tag")
                    return
                }
                
                database().getPlaceContext(id: tag) { (context) in
                    
                    guard let thisPlace = context else {
                        print("Failed to get placeContext")
                        return
                    }
                    
                    let newContext = PlacePerspective()
                    newContext.x = thisPlace.x + gesture.translation(in: self.view).x
                    newContext.y = thisPlace.y + gesture.translation(in: self.view).y
                    
                    newContext.numDevices = thisPlace.numDevices
                    newContext.placeID = thisPlace.placeID
                    newContext.radius = thisPlace.radius
                    newContext.realmPath = thisPlace.realmPath
                    
                    database().updatePlaceContext(placeContext: newContext)
                    
                }
                
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
    
    func reloadView() {
        
        self.viewDidLoad()
    }
}

extension PlacesView {
    
    func searchForHeepDevices() {
        HeepConnections().SearchForHeepDeviecs()
        
    }
    
    func userLogin() {
        navigationController?.pushViewController(AccountView(), animated: false)
    }
    
    func getActiveUserIcon() -> UIBarButtonItem {
        let myID = database().getMyHeepID()
        
        let userImage = openLocalIcon()
        
        database().getUserIcon(heepID: myID) {
            print("DONE DOWNLOADING")
            self.reloadView()
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
