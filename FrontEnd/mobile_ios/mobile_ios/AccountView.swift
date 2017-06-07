//
//  LoginViewController.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/10/17.
//  Copyright © 2017 Heep. All rights reserved.
//
import UIKit
import RealmSwift


class AccountView: UIViewController {
    
    var placesView = PlacesView()
    var userOffset: CGFloat = 75
    var userHeight: CGFloat = 50
    
    override func viewDidLoad() {
        let realm = try! Realm(configuration: configApp)
        let numUsers = realm.objects(User.self).count
        let binHeight = CGFloat((numUsers + 2) * 60 + 10)
        
        view.frame = CGRect(x: view.frame.maxX - 70,
                            y: 65,
                            width: userHeight + 20,
                            height: binHeight)
        
        self.view.backgroundColor = UIColor.clear
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(exitModalView)))
        
        //addBackdrop()
        addUserButtons()
        addLoginButton()
        //addExitButton()
        
    }
    
    func addUserButtons() {
        let realm = try! Realm(configuration: configApp)
        let loggedInUsers = realm.objects(User.self)
        
        for eachUser in loggedInUsers {
            print(eachUser)
            displayEachUserButton(user: eachUser)
        }
    }
    
    func displayEachUserButton(user: User) {
        
        let userButton = UIButton(frame: CGRect(x: self.view.frame.maxX - 60,
                                                y: userOffset,
                                                width: userHeight,
                                                height: userHeight))
        let userImage = UIImage(data: user.icon as Data)
        userButton.imageView?.contentMode = .scaleAspectFit
        userButton.setImage(userImage, for: .normal)
        userButton.tag = user.userID
        userButton.addTarget(self,
                             action: #selector(selectUser),
                             for: .primaryActionTriggered)
        
        userButton.layer.borderWidth = 1
        userButton.layer.borderColor = UIColor.white.cgColor
        userButton.layer.cornerRadius = 0.5 * userButton.bounds.size.width
        userButton.clipsToBounds = true
        
        
        userOffset += (userHeight + 10)
        self.view.addSubview(userButton)
    }
    
    func selectUser(sender: UIButton) {
        print("Selecting new user: \(sender.tag)")
        loginToUserRealm(user: sender.tag)
    }
    
    func loginToUserRealm(user: Int) {
        let realmApp = try! Realm(configuration: configApp)
        let app = realmApp.object(ofType: App.self, forPrimaryKey: 0)
        
        try! realmApp.write {
            app?.activeUser = user
        }
        
        configUser.fileURL = configUser.fileURL!.deletingLastPathComponent().appendingPathComponent("\(String(describing: user)).realm")
        
        exitModalView()
    }
    
    func addBackdrop() {
        let backdrop = UIView()
        backdrop.frame = view.frame
        backdrop.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        view.addSubview(backdrop)
    }
    
    func addLoginButton() {
        /*
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.frame = CGRect(x: self.view.frame.minX + 10,
                                   y: userOffset,
                                   width: self.view.bounds.width - 20,
                                   height: 35)
        
        loginButton.delegate = self
        view.addSubview(loginButton)*/
        
        let loginButton = UIButton(frame: CGRect(x: self.view.frame.maxX - 60,
                                                y: userOffset,
                                                width: userHeight,
                                                height: userHeight))
        loginButton.tag = 1
        loginButton.addTarget(self,
                             action: #selector(openLoginOptions),
                             for: .primaryActionTriggered)
        loginButton.backgroundColor = .blue
        loginButton.setTitle("+", for: .normal)
        loginButton.titleLabel?.adjustsFontSizeToFitWidth = true
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.cornerRadius = 0.5 * loginButton.bounds.size.width
        loginButton.clipsToBounds = true
        
        
        userOffset += (userHeight + 10)
        self.view.addSubview(loginButton)
        
        
        //print("User Profile \(String(describing: UserProfile.current))")
        
    }
    
    func openLoginOptions() {
        let modalViewController = LoginOptionsView()
        modalViewController.placesView = placesView
        
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: true, completion: nil)
        print("facebook?")
    }
    
    func addExitButton() {
        let exitButton = UIButton(frame: CGRect(x: self.view.frame.maxX - 60,
                                                y: userOffset,
                                                width: userHeight,
                                                height: userHeight))
        
        exitButton.setTitle("Exit", for: .normal)
        exitButton.titleLabel?.adjustsFontSizeToFitWidth = true
        exitButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        exitButton.backgroundColor = .red
        exitButton.titleLabel?.adjustsFontSizeToFitWidth = true
        exitButton.layer.borderWidth = 1
        exitButton.layer.borderColor = UIColor.white.cgColor
        exitButton.layer.cornerRadius = 0.5 * exitButton.bounds.size.width
        exitButton.clipsToBounds = true

        
        exitButton.addTarget(self, action: #selector(exitModalView), for: .primaryActionTriggered)
        view.addSubview(exitButton)
        
    }
    
    func exitModalView() {
        print("exiting")
        self.dismiss(animated: true, completion: { self.placesView.reloadView()})
    }
}
