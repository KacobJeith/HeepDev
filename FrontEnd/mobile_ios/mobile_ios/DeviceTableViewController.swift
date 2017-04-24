//
//  DeviceTableViewController.swift
//  mobile_ios
//
//  Created by Jercerb on 4/21/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit

var devices = [Device]()
var lastCount = 0


class DeviceTableViewController: UITableViewController {
    //MARK: Properties

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleDevices()
        sendValueToHeepDevice()
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
        
        let image = UIImage(named: devices[section].iconName)
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 5, y: 5, width: 35, height: 35)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        let label = UILabel()
        label.text = devices[section].name
        label.frame = CGRect(x: 45, y: 5, width: tableView.frame.size.width, height: 35)
        view.addSubview(label)
        
        return view
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numControls = devices[section].controlList.count
        
        return numControls
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        if (devices[indexPath.section].controlList[indexPath.row].controlDirection == 0){
            cell.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor(white: 0.6, alpha: 1.0)
        }
        
        let label = UILabel()
        label.text = devices[indexPath.section].controlList[indexPath.row].controlName
        label.frame = CGRect(x: 45, y: 5, width: tableView.frame.size.width, height: 35)
        cell.addSubview(label)
        
        
        if (devices[indexPath.section].controlList[indexPath.row].controlType == 0){
            let buttonSwitch = UISwitch()
            buttonSwitch.frame = CGRect(x: tableView.frame.size.width - 60, y: 5, width: 100, height: 35)
            cell.addSubview(buttonSwitch)
        } else {
            let slider = UISlider()
            slider.frame = CGRect(x: tableView.frame.size.width - 160, y: 5, width: 150, height: 35)
            cell.addSubview(slider)
            
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 45
    }
    
    
    
    private func loadSampleDevices() {
        
    }
    
    
    @IBAction func searchForHeepDevices() {
        print("Searching...")
        _ = HeepConnections.testSocket()
        
        let dispatchTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            
            print("In searchForHeepDevices Action")
            print(devices.count)
            
            self.CheckForNewDevicesAndDisplay()
        }
        

    }
    
    @IBAction func sendValueToHeepDevice() {
        print("Send Value")
    }
    
    private func CheckForNewDevicesAndDisplay() {
        if (devices.count != 0 && (devices.count - 1) != lastCount) {
            let previousCount = lastCount
            lastCount = devices.count
            tableView.beginUpdates()
            tableView.insertSections(IndexSet(previousCount...(devices.count-1)), with: .automatic)
            //tableView.insertRows(at: [IndexPath(row: 0, section: devices.count-1)], with: .automatic)
            tableView.endUpdates()
            
            
        }
    }

}
