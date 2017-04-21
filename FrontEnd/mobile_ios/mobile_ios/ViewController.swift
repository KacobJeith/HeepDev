//
//  ViewController.swift
//  mobile_ios
//
//  Created by Jacob Keith on 4/20/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import SwiftSocket

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchForHeepDevices() {
        // Insert TCP Search Here
        print("Searching...")
        testSocket()
        
        
    }
    
    private func testSocket() {
        let client = TCPClient(address:"192.168.0.104", port:5000)
        
        switch client.connect(timeout:1){
            case .success:
                print("success")
                switch client.send(string: "IsHeepDevice:") {
                    case .success:
                        print("GotData")
                    case .failure(let error):
                        print(error)
                }
            case .failure(let error):
                print(error)
        }
        
    }


}

