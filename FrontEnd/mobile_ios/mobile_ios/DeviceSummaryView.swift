//
//  DeviceSummaryViewController.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/10/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import RealmSwift

class DeviceSummaryViewController: UITableViewController {
    
    var sections: [String]!
    var cells: [[String]]!
    var thisDevice = Device()
    
    init(device: Device) {
        
        thisDevice = device
        self.cells = []
        
        super.init(style: UITableViewStyle.plain)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = thisDevice.name
        
        self.prepareUserData()
        self.prepareDeviceData()
        self.prepareControls()
        self.setupNavToolbar()
        
    }
    
    func prepareUserData() {
        self.sections = ["Device Admin"]
        let realm = try! Realm(configuration: configPublicSync)
        var humanData = [String]()
        
        if let adminID = realm.object(ofType: User.self, forPrimaryKey: thisDevice.humanAdmin)?.heepID {
            humanData.append(String.init(describing: adminID))
        } else {
            print("This Device's owner is not registered in the Heep User Directory")
        }
        
        self.cells.append(humanData)
    }
    
    func prepareDeviceData() {
        
        self.sections.append("Device: " + thisDevice.name)
        
        var deviceData = [String]()
        let deviceProps = thisDevice.propertyNames()
        var nextValue = ""
        
        for property in deviceProps {
            if property == "controlList" {
                continue
            }
            
            if let value = thisDevice.value(forKey: property) {
                nextValue = "\(property): \(String.init(describing: value))"
            } else {
                nextValue = "\(property): nil"
            }
            
            deviceData.append(nextValue)
        }
        
        self.cells.append(deviceData)
        
    }
    
    func prepareControls() {
        
        for control in thisDevice.controlList {
            prepareControlData(control: control)
            
            for vertex in control.vertexList {
                prepareVertex(vertex: vertex)
                
            }
        }
    }
    
    func prepareControlData(control: DeviceControl) {
        
        self.sections.append("Control: " + control.controlName)
        
        var controlData = [String]()
        let controlProps = control.propertyNames()
        var nextValue = ""
        
        for property in controlProps {
            if property == "vertexList" {
                continue
            }
            
            if let value = control.value(forKey: property) {
                nextValue = "\(property): \(String.init(describing: value))"
            } else {
                nextValue = "\(property): nil"
            }
            
            controlData.append(nextValue)
        }
        
        self.cells.append(controlData)
    }
    
    func prepareVertex(vertex: Vertex) {
        self.sections.append("Vertex: " + vertex.vertexID)
        
        let txName = "tx Name: " + (vertex.tx?.controlName)!
        let txID = "tx ID: " + String(describing: (vertex.tx?.uniqueID)!)
        let rxName = "rx Name: " + (vertex.rx?.controlName)!
        let rxID = "rx ID: " + String(describing: (vertex.rx?.uniqueID)!)
        
        let thisVertex = [txName, txID, rxName, rxID]
        self.cells.append(thisVertex)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    func setupNavToolbar() {
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let claim = UIBarButtonItem(title: "Claim Device",
                                    style: .plain,
                                    target: self,
                                    action: #selector(claimDevice))
        
        let grant = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addUserToThisDevice))
        
        self.toolbarItems = [spacer,  claim, spacer, grant]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return self.sections.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 45
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        
        let label = UILabel()
        label.frame = CGRect(x: 5, y: 5, width: tableView.frame.size.width, height: 35)
        label.text = self.sections[section]
        view.addSubview(label)
        
        return view
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.cells[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let label = UILabel()
        label.text = self.cells[indexPath.section][indexPath.row]
        label.frame = CGRect(x: 60, y: 5, width: tableView.frame.size.width, height: 35)
        cell.addSubview(label)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func claimDevice() {
        //HeepConnections().sendAssignAdminToHeepDevice(deviceID: thisDevice.deviceID)
        createDeviceRealm(deviceID: thisDevice.deviceID)
        
        let realm = try! Realm(configuration: configUser)
        
        if let myID = realm.objects(User.self).first?.heepID {
            
            try! realm.write {
                thisDevice.humanAdmin = myID
            }
            
        } else {
            
            print("I am not assigned a Heep ID for some reason....going to have issues")
        }
        
    }
    
    func addUserToThisDevice() {
        let modalViewController = UserSearch(device: thisDevice)
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: false) {
            print("Completed")
        }
    }
    
}
