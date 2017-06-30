//
//  DeviceSummaryViewController.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/10/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit

class DeviceSummaryViewController: UITableViewController {
    
    var sections: [String]!
    var cells: [[String]]!
    var thisDevice = Device()
    
    init(device: Device) {
        self.sections = ["Device: " + device.name]
        
        thisDevice = device
        
        let deviceData = [
            "ID: " + String(device.deviceID),
            "Firmware Version: " + String(device.version),
            "IP Address: " + device.ipAddress,
            "Icon Name: " + device.iconName]
        
        self.cells = []
        self.cells.append(deviceData)
        
        for control in device.controlList {
            self.sections.append("Control: " + control.controlName)
            let direction = control.controlDirection == 0 ? "Input" : "Output"
            let type = control.controlType == 0 ? "Binary" : "Range"
            let thisControl = [
                "Control Direction: " + direction,
                "Control Type: " + type,
                "Current Value: " + String(control.valueCurrent)]
            self.cells.append(thisControl)
            
            for vertex in control.vertexList {
                self.sections.append("Vertex: " + vertex.vertexID)
                let txName = "tx Name: " + (vertex.tx?.controlName)!
                let txID = "tx ID: " + String(describing: (vertex.tx?.uniqueID)!)
                let rxName = "rx Name: " + (vertex.rx?.controlName)!
                let rxID = "rx ID: " + String(describing: (vertex.rx?.uniqueID)!)
                
                let thisVertex = [txName, txID, rxName, rxID]
                self.cells.append(thisVertex)
                
            }
        }
        
        
        
        super.init(style: UITableViewStyle.plain)
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavToolbar()

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
    }
    
    func addUserToThisDevice() {
        let modalViewController = UserSearch()
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: false) {
            print("Completed")
        }
    }
    
}
