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
        self.toolbarItems = [toolbarContent, spacer]

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
        let newPlace = Place()
        let currentWifi = currentWifiInfo()
        newPlace.ssid = currentWifi.ssid
        newPlace.bssid = currentWifi.bssid
        newPlace.name = currentWifi.ssid
        
        try! realm.write {
            
            realm.add(newPlace)
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
        button.tag = bssids.count - 1
        self.view.addSubview(button)
        
        
        button.addTarget(self,
                         action: #selector(drag),
                         for: [UIControlEvents.touchDragInside,
                               UIControlEvents.touchDragOutside,
                               UIControlEvents.touchDragExit])
        
        button.addTarget(self,
                         action: #selector(enterPlace),
                         for: .touchDownRepeat)
    }
    
    func enterPlace(sender: UIButton) {
        let enterPlace = realm.object(ofType: Place.self, forPrimaryKey: bssids[sender.tag])
        navigationController?.pushViewController(DeviceTableViewController(place: enterPlace!), animated: true)
        
        
    }
    
    func drag(control: UIControl, event: UIEvent) {

        
        if let center = event.allTouches?.first?.location(in: self.view) {
            control.center = center
            let realm = try! Realm(configuration: config)
            try! realm.write {
                realm.create(Place.self,
                             value: ["bssid": bssids[(event.allTouches?.first?.view!.tag)!],
                                     "x": center.x,
                                     "y": center.y],
                             update: true)
            }
        }
    }
    
    func deleteAll() {
        print("Deleting all Devices")
        try! realm.write {
         
            realm.deleteAll()
            
         }
        
        self.loadView()
        self.viewDidLoad()
    }
    

}
