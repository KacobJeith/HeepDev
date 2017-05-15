//
//  DeviceTableViewController.swift
//  mobile_ios
//
//  Created by Jercerb on 4/21/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import RealmSwift

class DeviceTableViewController: UITableViewController {
    //MARK: Properties
    
    var notificationToken: NotificationToken!
    let devices: Results<Device>
    var controlTags = [IndexPath]()
    let realm = try! Realm(configuration: config)
    
    init(place: Place) {
        devices = realm.objects(Device.self).filter("associatedPlace = %s", place.bssid)
        super.init(style: UITableViewStyle.plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        print(user.name)
        super.viewDidLoad()
        self.title = "Heep Device List"
                
        let toolbarContent = UIBarButtonItem()
        toolbarContent.title = "Search for Heep Devices"
        //self.navigationItem.hidesBackButton = true
        self.navigationController?.isToolbarHidden = false
        toolbarContent.target = self
        toolbarContent.action = #selector(searchForHeepDevices)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        self.toolbarItems = [spacer, toolbarContent, spacer]
        
        searchForHeepDevices()
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return devices.count

    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.white
        
        let image = UIImage(named: (devices[section].iconName))
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 5, y: 5, width: 35, height: 35)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        let label = UILabel()
        label.text = devices[section].name
        label.frame = CGRect(x: 45, y: 5, width: tableView.frame.size.width, height: 35)
        view.addSubview(label)
        
        let summary = UIButton(type: .detailDisclosure)
        summary.frame = CGRect(x: tableView.frame.size.width - 60, y: 5, width: 60, height: 40)
        summary.tag = section
        summary.addTarget(self, action: #selector(displayDeviceSummary), for: UIControlEvents.primaryActionTriggered)
        
        view.addSubview(summary)
        
        return view
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(devices)
        print(devices[section].controlList)
        let numControls = devices[section].controlList.count
        print("CONTROLS" + String(numControls))
        return numControls
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        if (devices[indexPath.section].controlList[indexPath.row].controlDirection == 0){
            cell.backgroundColor = UIColor(white: 0.85, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        }
        
        let label = UILabel()
        label.text = devices[indexPath.section].controlList[indexPath.row].controlName
        label.frame = CGRect(x: 60, y: 5, width: tableView.frame.size.width, height: 35)
        cell.addSubview(label)
        
        controlTags.append(indexPath)
        
        
        if (devices[indexPath.section].controlList[indexPath.row].controlType == 0){
            let buttonSwitch = UISwitch()
            let thisSwitchState = devices[indexPath.section].controlList[indexPath.row].valueCurrent == 1
            buttonSwitch.tag = controlTags.count - 1
            buttonSwitch.frame = CGRect(x: tableView.frame.size.width - 60, y: 5, width: 100, height: 35)
            buttonSwitch.setOn(thisSwitchState, animated: true)
            buttonSwitch.addTarget(self, action: #selector(DeviceTableViewController.toggle), for: UIControlEvents.valueChanged)
            cell.addSubview(buttonSwitch)
        } else {
            let slider = UISlider()
            slider.tag = controlTags.count - 1
            slider.minimumValue = Float(devices[indexPath.section].controlList[indexPath.row].valueLow)
            slider.maximumValue = Float(devices[indexPath.section].controlList[indexPath.row].valueHigh)
            slider.setValue(Float(devices[indexPath.section].controlList[indexPath.row].valueCurrent), animated: true)
            slider.frame = CGRect(x: tableView.frame.size.width - 160, y: 5, width: 150, height: 35)
            slider.addTarget(self, action: #selector(DeviceTableViewController.sliderUpdate), for: UIControlEvents.valueChanged)
            
            cell.addSubview(slider)
            
        }
        
        return cell
    }
    
    func toggle(sender: UISwitch) {
        
        let realm = try! Realm(configuration: config)
        let thisIndexPath = controlTags[sender.tag]
        let thisControlUniqueID = devices[thisIndexPath.section].controlList[thisIndexPath.row].uniqueID
        var newValue = 0
        
        if (sender.isOn) {
            newValue = 1
        }
        
        try! realm.write {
            realm.create(DeviceControl.self,
                        value: ["uniqueID": thisControlUniqueID,
                                "valueCurrent": newValue],
                        update: true)
        }
        
        DispatchQueue.global().async {
            HeepConnections().sendValueToHeepDevice(uniqueID: thisControlUniqueID)
        }
        
    }
    
    func sliderUpdate(sender: UISlider) {
        
        let realm = try! Realm(configuration: config)
        let thisIndexPath = controlTags[sender.tag]
        let thisControlUniqueID = devices[thisIndexPath.section].controlList[thisIndexPath.row].uniqueID
        
        let newValue = Int(round(sender.value))
        
        try! realm.write {
            realm.create(DeviceControl.self,
                         value: ["uniqueID": thisControlUniqueID,
                                 "valueCurrent": newValue],
                         update: true)
        }
        
        DispatchQueue.global().async {
            HeepConnections().sendValueToHeepDevice(uniqueID: thisControlUniqueID)
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 45
    }
    
    func displayDeviceSummary(sender: UIButton) {
        print("Display device summary for: \(String(describing: devices[sender.tag].deviceID))")
        let summaryView = DeviceSummaryViewController(device: devices[sender.tag])
        navigationController?.pushViewController(summaryView, animated: true)
    }
    
    
    @IBAction func searchForHeepDevices() {
        print("Searching...")
        HeepConnections().SearchForHeepDeviecs()
        let dispatchTime = DispatchTime.now() + .seconds(2)
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            
            print("In searchForHeepDevices Action")
            
            self.CheckForNewDevicesAndDisplay()
        }
        

    }
    
    func CheckForNewDevicesAndDisplay() {
        self.tableView.reloadData()
        
    }

}
