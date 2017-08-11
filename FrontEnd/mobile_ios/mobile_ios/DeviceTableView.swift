//
//  DeviceTableViewController.swift
//  mobile_ios
//
//  Created by Jercerb on 4/21/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit

class DeviceTableViewController: UITableViewController {
    //MARK: Properties
    
    var activeOnly = false
    var placeID = 0
    var tableTitle = "Currently Active"
    
    var referenceList = [String?]()
    
    var devices = [Int: Device]()
    var controls = [Int: [Int: DeviceControl]]()
    var controlTags = [Int: IndexPath]()
    
    init(title: String = "Currently Active", placeID: Int = 0, activeOnly: Bool = false) {
        super.init(style: UITableViewStyle.plain)
        self.placeID = placeID
        self.activeOnly = activeOnly
        self.tableTitle = title
        
        self.initNotifications()
    }
    
    func initNotifications() {
        
        self.referenceList.append(database().watchAllMyDevices() { deviceID in
            
            self.controls[deviceID] = [Int: DeviceControl]()
            self.controlTags = [:]
            
            self.referenceList.append(database().getDevice(deviceID: deviceID, reset: {
                
            }, identity: { device in
                
                if device.active {
                    self.devices[device.deviceID] = device
                    self.reloadView()
                }
                
                
            }, controls: { control in
                
                
                self.controls[control.deviceID]?[control.controlID] = control
                
                self.reloadView()

                
            }, vertices: { vertex in
                
                
            }))
            
        })
        
    }
    
    func reloadView() {
        
        self.viewDidLoad()
        self.tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = tableTitle
        
        self.navigationController?.isToolbarHidden = false
        
        
        
        let search = UIBarButtonItem(title: "Search For Devices",
                                     style: .plain,
                                     target: self,
                                     action: #selector(searchForHeepDevices))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                     target: nil,
                                     action: nil)
        
        
        self.toolbarItems = [spacer, search, spacer]
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit{
        for reference in referenceList {
            if let refPath = reference {
                database().detachObserver(referencePath: refPath)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        for reference in referenceList {
            if let refPath = reference {
                database().detachObserver(referencePath: refPath)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.initNotifications()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return [Int](devices.keys).count

    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.white
        
        let keyList = [Int](devices.keys)
        
        if section > [Int](devices.keys).count {
            return nil
        }
        
        let thisKey = keyList[section]
        
        guard let thisDevice = devices[thisKey] else {
            print("Failed to grab device")
            return nil
        }
        
        let image = UIImage(named: thisDevice.iconName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 5, y: 5, width: 35, height: 35)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        let label = UILabel()
        label.text = thisDevice.name
        label.frame = CGRect(x: 45, y: 5, width: tableView.frame.size.width, height: 35)
        view.addSubview(label)
        
        let summary = UIButton(type: .detailDisclosure)
        summary.frame = CGRect(x: tableView.frame.size.width - 60, y: 5, width: 60, height: 40)
        summary.tag = thisKey
        summary.addTarget(self, action: #selector(displayDeviceSummary), for: UIControlEvents.primaryActionTriggered)
        
        view.addSubview(summary)
        
        return view
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let keyList = [Int](controls.keys)
        
        if section > keyList.count {
            return 0
        }
        let thisKey = keyList[section]
        
        guard let numControls = controls[thisKey]?.count else {
            return 0
        }
        
        return numControls
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let keyList = [Int](controls.keys)
        
        if indexPath.section > keyList.count {
            return cell
        }
        
        let thisKey = keyList[indexPath.section]
        
        guard let thisControl = controls[thisKey]?[indexPath.row] else {
            print("couldnt grab control")
            return cell
        }
        
        if (thisControl.controlDirection == 0){
            cell.backgroundColor = UIColor(white: 0.85, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        }
        
        let label = UILabel()
        label.text = thisControl.controlName
        label.frame = CGRect(x: 60, y: 5, width: tableView.frame.size.width, height: 35)
        cell.addSubview(label)
        
        controlTags[thisControl.uniqueID] = indexPath
        
        
        if (thisControl.controlType == 0){
            let buttonSwitch = UISwitch()
            let thisSwitchState = thisControl.valueCurrent == 1
            buttonSwitch.tag = thisControl.uniqueID
            buttonSwitch.frame = CGRect(x: tableView.frame.size.width - 60, y: 5, width: 100, height: 35)
            buttonSwitch.setOn(thisSwitchState, animated: false)
            buttonSwitch.addTarget(self, action: #selector(toggle), for: UIControlEvents.valueChanged)
            cell.addSubview(buttonSwitch)
        } else {
            let slider = UISlider()
            slider.tag = thisControl.uniqueID
            slider.minimumValue = Float(thisControl.valueLow)
            slider.maximumValue = Float(thisControl.valueHigh)
            slider.setValue(Float(thisControl.valueCurrent), animated: false)
            slider.frame = CGRect(x: tableView.frame.size.width - 160, y: 5, width: 150, height: 35)
            slider.addTarget(self, action: #selector(sliderUpdate), for: UIControlEvents.valueChanged)
            
            cell.addSubview(slider)
            
        }
        
        return cell
    }
    
    func toggle(sender: UISwitch) {
        guard let originalControl = getControlFromTag(tag: sender.tag) else {
            return
        }
        
        var newValue = 0
        
        if (sender.isOn) {
            newValue = 1
        }
        
        let updateControl = DeviceControl(value: originalControl)
        
        updateControl.valueCurrent = newValue
        
        database().updateDeviceControl(control: updateControl)
        
        DispatchQueue.global().async {
            //HeepConnections().sendValueToHeepDevice(uniqueID: originalControl.uniqueID)
        }
        
    }
    
    func getControlFromTag(tag: Int) -> DeviceControl? {
        guard let thisIndexPath = controlTags[tag] else {
            return nil
        }
        
        let keyList = [Int](controls.keys)
        print(keyList)
        
        if thisIndexPath.section > keyList.count {
            return nil
        }
        
        let thisKey = keyList[thisIndexPath.section]
        
        guard let originalControl = controls[thisKey]?[thisIndexPath.row] else {
            print("couldnt grab control")
            return nil
        }
        
        return originalControl
        
    }
    
    func sliderUpdate(sender: UISlider) {
        
        guard let originalControl = getControlFromTag(tag: sender.tag) else {
            return
        }
        
        let newValue = Int(round(sender.value))
        let updateControl = DeviceControl(value: originalControl)
        updateControl.valueCurrent = newValue
        
        database().updateDeviceControl(control: updateControl)
        
        DispatchQueue.global().async {
            //HeepConnections().sendValueToHeepDevice(uniqueID: originalControl.uniqueID)
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 45
    }
    
    func displayDeviceSummary(sender: UIButton) {
        print("Display device summary for: \(String(describing: sender.tag))")
        let summaryView = DeviceSummaryViewController(deviceID: sender.tag)
        navigationController?.pushViewController(summaryView, animated: true)
    }
    
    func searchForHeepDevices() {
        print("Searching...")
        HeepConnections().SearchForHeepDeviecs()
        
    }
}
