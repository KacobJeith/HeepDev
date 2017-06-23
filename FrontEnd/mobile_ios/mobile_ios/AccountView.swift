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
    var optionsOffset: CGFloat = 75
    var userOffset: CGFloat = 120
    var userHeight: CGFloat = 45
    var activeUser = User()
    
    override func viewDidLoad() {
        let numUsers = SyncUser.all.count
        let binHeight = CGFloat((numUsers + 2) * 60 + 10)
        
        
        /*view.frame = CGRect(x: view.frame.maxX - 70,
                            y: 65,
                            width: userHeight + 20,
                            height: binHeight)
        */
        self.view.backgroundColor = UIColor.clear
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(exitModalView)))
        
        //addBackdrop()
        addUserButtons()
        addLoginButton()
        addLogoutButton()
        
    }
    
    func addUserButtons() {
        
        let loggedInUsers = SyncUser.all
        
        for eachUser in loggedInUsers {
            print(eachUser)
            //displayEachUserButton(user: eachUser)
        }
    }
    
    func displayEachUserButton(user: User) {
        
        if user == activeUser {
            return
        }
        
        let userButton = UIButton(frame: CGRect(x: self.view.bounds.maxX - userOffset,
                                                y: 17,
                                                width: userHeight,
                                                height: userHeight))
        
        let userImage = UIImage(data: user.icon as Data)
        userButton.imageView?.contentMode = .scaleAspectFit
        userButton.setImage(userImage, for: .normal)
        userButton.tag = user.heepID
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
        let realm = try! Realm(configuration: configPublic)
        let selectedUser = realm.object(ofType: User.self, forPrimaryKey: sender.tag)
        
        //loginToUserRealmSync(username: (selectedUser?.email)!, password: (selectedUser?.password)!)
    }
    
    func addBackdrop() {
        let backdrop = UIView()
        backdrop.frame = view.frame
        backdrop.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        view.addSubview(backdrop)
    }
    
    func addLoginButton() {
        let loginButton = UIButton(frame: CGRect(x: self.view.bounds.maxX - userOffset,
                                                 y: 17,
                                                 width: userHeight,
                                                 height: userHeight))
        loginButton.tag = 1
        loginButton.addTarget(self,
                             action: #selector(openLoginOptions),
                             for: .primaryActionTriggered)
        loginButton.backgroundColor = .gray
        loginButton.setTitle("+", for: .normal)
        loginButton.titleLabel?.adjustsFontSizeToFitWidth = true
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.cornerRadius = 0.5 * loginButton.bounds.size.width
        loginButton.clipsToBounds = true
        
        
        userOffset += (userHeight + 10)
        self.view.addSubview(loginButton)
        
        
    }
    
    func openLoginOptions() {
        let modalViewController = EmailLoginView(frame: CGRect(x: self.view.frame.width/6,
                                                               y: self.view.frame.height/3,
                                                               width: 2 * self.view.bounds.width/3,
                                                               height: self.view.bounds.height/3))
        //modalViewController.prevView = self
        
        modalViewController.modalPresentationStyle = .overCurrentContext
        present(modalViewController, animated: true, completion: nil)

    }
    
    func addLogoutButton() {
        let logoutButton = UIButton(frame: CGRect(x: self.view.frame.maxX - 60,
                                                y: optionsOffset,
                                                width: userHeight,
                                                height: userHeight))
        
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.titleLabel?.adjustsFontSizeToFitWidth = true
        logoutButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        logoutButton.backgroundColor = .gray
        logoutButton.titleLabel?.adjustsFontSizeToFitWidth = true
        logoutButton.layer.borderWidth = 1
        logoutButton.layer.borderColor = UIColor.white.cgColor
        logoutButton.layer.cornerRadius = 0.5 * logoutButton.bounds.size.width
        logoutButton.clipsToBounds = true
        
        optionsOffset += userHeight
        
        logoutButton.addTarget(self, action: #selector(logoutUser), for: .primaryActionTriggered)
        view.addSubview(logoutButton)
        
    }
    
    func logoutUser() {
        print("Log \(SyncUser.current) Out")
        
        logoutOfAllRealmUsers()
        
        exitModalView()
        
    }
    
    func exitModalView() {
        print("exiting")
        self.dismiss(animated: true, completion: { self.placesView.reloadView()})
    }
}
