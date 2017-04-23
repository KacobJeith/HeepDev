//
//  DeviceTableViewController.swift
//  mobile_ios
//
//  Created by Jercerb on 4/21/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit

var devices = [Device]()


class DeviceTableViewController: UITableViewController {
    //MARK: Properties

    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleDevices()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return devices.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String {
        
        return String(devices[section].deviceID)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let keys = deviceDictionary.keys
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "DeviceTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DeviceTableViewCell else {
            fatalError("The dequeued cell is not an instance of DeviceTableViewCell.")
        }
        
        //fetches the appropriate device or the data source layout. 
        //let device = devices[indexPath.row]
        
        cell.nameDevice.text = "testy"
        cell.deviceIconView.image = UIImage(named: "switch")

        return cell
    }
    
    
    private func loadSampleDevices() {
        /*
        let photo1 = UIImage(named: "lightbulb")
        let photo2 = UIImage(named: "switch")
        let photo3 = UIImage(named: "outlet")
        
        guard let device1 = Device(name: "Blinky", photo: photo1) else { fatalError("Unable to instantiate device1")}
        guard let device2 = Device(name: "ButtonSwitch", photo: photo2) else { fatalError("Unable to instantiate device2")}
        guard let device3 = Device(name: "Outlet", photo: photo3) else { fatalError("Unable to instantiate device3")}
        
        devices += [device1, device2, device3]
        */
    }
    
    
    @IBAction func searchForHeepDevices() {
        // Insert TCP Search Here
        print("Searching...")
        let newData = HeepConnections.testSocket()
        //addDevice(device: newDevice)
        print("In searchForHeepDevices Action")
        print(devices.count)
        
        if (newData) {
            tableView.beginUpdates()
            tableView.insertSections(IndexSet(0...(devices.count-1)), with: .automatic)
            //tableView.insertRows(at: [IndexPath(row: 0, section: devices.count-1)], with: .automatic)
            tableView.endUpdates()
        }
        

    }

}
