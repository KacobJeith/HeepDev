//
//  VertexCollection.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/16/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import RealmSwift

class EditRoomView: UITableViewController {
    
    let devices: [Device]
    let realm = try! Realm(configuration: config)
    
    init(bssid: String) {
        devices = Array(realm.objects(Device.self).filter("associatedPlace = %s", bssid))
        super.init(style: UITableViewStyle.plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "EDIT THIS ROOM PLZ"
        self.navigationController?.isToolbarHidden = true
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cell = UITableViewCell()
        
        if (indexPath.row == 0) {
            let cell = DeviceControlPuck()
            cell.devices = devices
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var customHeight = CGFloat(100)
        
        if (indexPath.row == 1) {
            customHeight = self.view.frame.height - 200
        }
        
        return customHeight
    }    
    
}
