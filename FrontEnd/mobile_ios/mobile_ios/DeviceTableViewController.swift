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
    var devices = [Device]()

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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return devices.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "DeviceTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DeviceTableViewCell else {
            fatalError("The dequeued cell is not an instance of DeviceTableViewCell.")
        }
        
        //fetches the appropriate device or the data source layout. 
        let device = devices[indexPath.row]
        
        cell.nameDevice.text = device.name
        cell.deviceIconView.image = device.photo

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func loadSampleDevices() {
        let photo1 = UIImage(named: "lightbulb")
        let photo2 = UIImage(named: "switch")
        let photo3 = UIImage(named: "outlet")
        
        guard let device1 = Device(name: "Blinky", photo: photo1) else { fatalError("Unable to instantiate device1")}
        guard let device2 = Device(name: "ButtonSwitch", photo: photo2) else { fatalError("Unable to instantiate device2")}
        guard let device3 = Device(name: "Outlet", photo: photo3) else { fatalError("Unable to instantiate device3")}
        
        devices += [device1, device2, device3]
        
        
    }
    
    @IBAction func searchForHeepDevices() {
        // Insert TCP Search Here
        print("Searching...")
        HeepConnections.testSocket()
        
    }

}
