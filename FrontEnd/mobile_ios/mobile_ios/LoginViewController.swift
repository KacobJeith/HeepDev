//
//  LoginViewController.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/10/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class LoginViewController: UIViewController {
    
    //let DeviceController = DeviceTableViewController()

    override func viewDidLoad() {
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
        
        view.addSubview(loginButton)
        // Do any additional setup after loading the view.
    }

    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    */
   
    /*@IBAction func login() {
        print("Logging you in!")
        navigationController?.pushViewController(DeviceController, animated: true)
        //present(DeviceController, animated: true, completion: (() -> Void)?)
        
    }*/

}
