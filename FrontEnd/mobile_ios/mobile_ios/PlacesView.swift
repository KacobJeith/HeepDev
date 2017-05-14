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
    
    //let realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "MyInMemoryRealm"))
    let realm = try! Realm(configuration: config)
    var bssids = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Places"
        self.view.backgroundColor = .white
        /*try! realm.write {
            
            realm.deleteAll()
        }*/
        addPlaces()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func addPlaces() {
        let thisWifiCheck = realm.objects(Place.self).filter("bssid == %s", currentWifi["bssid"]!)
        if (thisWifiCheck.count == 0) {
            addPlaceToRealm()
        }
        
        let allPlaces = realm.objects(Place.self)
        
        for place in allPlaces {
            print(place)
            drawPlace(thisX: place.x,
                      thisY: place.y,
                      thisName: place.name,
                      numDevices: place.devices.count,
                      thisBSSID: place.bssid)
        }
        
    }
    
    
    func addPlaceToRealm() {
        let newPlace = Place()
        newPlace.ssid = currentWifi["ssid"]!
        newPlace.bssid = currentWifi["bssid"]!
        newPlace.name = currentWifi["ssid"]!
        
        try! realm.write {
            
            realm.add(newPlace)
        }
    }
    
    func drawPlace(thisX: Int, thisY: Int, thisName: String, numDevices: Int, thisBSSID: String) {
        bssids.append(thisBSSID)
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.backgroundColor = numDevices == 0 ? .white : getRandomColor()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.setTitle("  " + thisName + "  ", for: [])
        button.setTitleColor(UIColor.black, for: UIControlState.normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.tag = bssids.count - 1
        self.view.addSubview(button)
        
        
        button.addTarget(self,
                         action: #selector(drag(control:event:)),
                         for: UIControlEvents.touchDragInside)
        button.addTarget(self,
                         action: #selector(drag(control:event:)),
                         for: [UIControlEvents.touchDragExit,
                               UIControlEvents.touchDragOutside])
        
        
        button.addTarget(self, action: #selector(enterPlace), for: .touchDownRepeat)
    }
    
    func enterPlace(sender: UIButton) {
        let enterPlace = realm.object(ofType: Place.self, forPrimaryKey: bssids[sender.tag])
        navigationController?.pushViewController(DeviceTableViewController(place: enterPlace!), animated: true)
    }
    
    func drag(control: UIControl, event: UIEvent) {
        if let center = event.allTouches?.first?.location(in: self.view) {
            control.center = center
        }
    }
    
    

}
