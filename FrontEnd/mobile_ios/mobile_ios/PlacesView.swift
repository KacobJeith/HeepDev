//
//  PlacesView.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/11/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit

class PlacesView: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Places"
        self.view.backgroundColor = .white
        let currentWifi = HeepConnections().printCurrentWifiInfo()
        
        
        addPlaces(currentWifiName: currentWifi)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func addPlaces(currentWifiName: String) {
        
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.backgroundColor = .green
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        button.setTitle(currentWifiName, for: [])
        button.setTitleColor(UIColor.black, for: UIControlState.normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
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
    
    func enterPlace() {
        navigationController?.pushViewController(DeviceTableViewController(), animated: true)
    }
    
    func drag(control: UIControl, event: UIEvent) {
        if let center = event.allTouches?.first?.location(in: self.view) {
            control.center = center
        }
    }

}
