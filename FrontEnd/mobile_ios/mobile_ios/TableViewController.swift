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
        let client = TCPClient(address:"192.168.0.100", port:5000)
        
        switch client.connect(timeout:1){
        case .success:
            print("success")
            var bufferarray = [UInt8]()
            bufferarray.append(0x09)
            bufferarray.append(0x00)
            
            
            switch client.send(data: bufferarray) {
            case .success:
                guard let data = client.read(1024*10) else { return }
                print(data)
                if let response = String(bytes:data, encoding: .utf8) {
                    print(response)
                }
                
            case .failure(let error):
                print(error)
            }
        case .failure(let error):
            print(error)
        }
        
    }
    
    
}

