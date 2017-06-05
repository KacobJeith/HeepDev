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
        print("User Profile \(UserProfile.current)")
        facebookLogin()
    }
    
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        print("login button did complete")
        switch result {
        case .failed(let error):
            print(error)
        case .cancelled:
            print("Cancelled")
        case .success(let grantedPermissions, let declinedPermissions, let accessToken):
            print("Logged In")
            facebookLogin()
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        print("Logged Out")
    }
    
    func facebookLogin() {
        if let accessToken = AccessToken.current {
            
            let params = ["fields":"name,email,picture"]
            let graphRequest = GraphRequest(graphPath: "/103528713584037", parameters: params)
            graphRequest.start { (urlResponse, requestResult) in
                switch requestResult {
                case .failed(let error):
                    print(error)
                case .success(let graphResponse):
                    if let responseDictionary = graphResponse.dictionaryValue {
                        print(responseDictionary)
                        UserDefaults.standard.set(responseDictionary, forKey: "userInfo")
                        
                    }
                }
            }
            
            let graphFriendRequest = GraphRequest(graphPath: "/103528713584037/friends", parameters: params)
            graphFriendRequest.start { (urlResponse, requestResult) in
                switch requestResult {
                case .failed(let error):
                    print(error)
                case .success(let graphResponse):
                    if let responseDictionary = graphResponse.dictionaryValue {
                        print(responseDictionary)
                        //UserDefaults.standard.set(responseDictionary, forKey: "userInfo")
                        
                    }
                }
            }
            
            
            
        } else {
        }
    }
    
}
