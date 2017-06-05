//
//  LoginViewController.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/10/17.
//  Copyright © 2017 Heep. All rights reserved.
//
import UIKit
import FacebookLogin
import FacebookCore


class LoginView: UIViewController, LoginButtonDelegate {
    
    override func viewDidLoad() {
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        
        
        loginButton.center = view.center
        loginButton.delegate = self
        view.addSubview(loginButton)
        print(AccessToken.current)
    }
    
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        print("login button did complete")
        print(AccessToken.current)
        switch result {
        case .failed(let error):
            print(error)
        case .cancelled:
            print("Cancelled")
        case .success(let grantedPermissions, let declinedPermissions, let accessToken):
            print("Logged In")
            print(accessToken)
            facebookLogin()
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        print("Logged Out")
    }
    
    func facebookLogin() {
        if let accessToken = AccessToken.current {
            let params = ["fields":"name,email"]
            let graphRequest = GraphRequest(graphPath: "me", parameters: params)
            graphRequest.start { (urlResponse, requestResult) in
                switch requestResult {
                case .failed(let error):
                    print(error)
                case .success(let graphResponse):
                    if let responseDictionary = graphResponse.dictionaryValue {
                        UserDefaults.standard.set(responseDictionary, forKey: "userInfo")
                    }
                }
            }
        } else {
        }
    }
}
