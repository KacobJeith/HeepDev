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
import RealmSwift


class LoginView: UIViewController, LoginButtonDelegate {
    
    var placesView = PlacesView()
    var userOffset: CGFloat = 75
    var userHeight: CGFloat = 50
    
    override func viewDidLoad() {
        let realm = try! Realm(configuration: configApp)
        let numUsers = realm.objects(User.self).count
        let binHeight = CGFloat(numUsers * 60 + 35 + 35 + 10)
        
        view.frame = CGRect(x: view.bounds.width/2,
                            y: 65,
                            width: view.bounds.width/2,
                            height: binHeight)
        
        view.backgroundColor = UIColor.clear
        
        addBackdrop()
        addUserButtons()
        addLoginButton()
        addExitButton()
        
        
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
        
        let userButton = UIButton(frame: CGRect(x: self.view.frame.minX + (self.view.bounds.width/2 - userHeight/2),
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
        
        userOffset += (userHeight + 10)
        self.view.addSubview(userButton)
    }
    
    func selectUser(sender: UIButton) {
        print("Selecting new user: \(sender.tag)")
    }
    
    func addBackdrop() {
        let backdrop = UIView()
        backdrop.frame = view.frame
        backdrop.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        view.addSubview(backdrop)
    }
    
    func addLoginButton() {
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.frame = CGRect(x: self.view.frame.minX + 10,
                                   y: userOffset,
                                   width: self.view.bounds.width - 20,
                                   height: 35)
        
        loginButton.delegate = self
        view.addSubview(loginButton)
        print("User Profile \(String(describing: UserProfile.current))")
        
    }
    
    func addExitButton() {
        let exitButton = UIButton(frame: CGRect(x: self.view.frame.minX + 5,
                                                y: self.view.frame.maxY - 35,
                                                width: self.view.frame.width,
                                                height: 35))
        
        exitButton.setTitle("Exit", for: .normal)
        exitButton.titleLabel?.adjustsFontSizeToFitWidth = true
        exitButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        exitButton.addTarget(self, action: #selector(exitModalView), for: .primaryActionTriggered)
        view.addSubview(exitButton)
    }
    
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        print("login button did complete")
        switch result {
        case .failed(let error):
            print(error)
        case .cancelled:
            print("Cancelled")
        case .success(_,_,_):
            print("Logged In")
            facebookLogin()
        }
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition{
        return .topAttached;
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        print("Logged Out")
    }
    
    func facebookLogin() {
        if let accessToken = AccessToken.current {
            //print(UserDefaults.standard.dictionaryRepresentation())
            let params = ["fields":"name,email,picture"]
            let graphRequest = GraphRequest(graphPath: "me", parameters: params)
            graphRequest.start { (urlResponse, requestResult) in
                switch requestResult {
                case .failed(let error):
                    print(error)
                case .success(let graphResponse):
                    if let responseDictionary = graphResponse.dictionaryValue {
                        print(responseDictionary)
                        UserDefaults.standard.set(responseDictionary, forKey: "userInfo")
                        let name = responseDictionary["name"] as! String
                        let pic = responseDictionary["picture"] as! NSDictionary
                        let data = pic["data"] as! NSDictionary
                        let url = data["url"] as! String
                        let id = responseDictionary["id"] as! String
                        self.seedNewUserFromFacebook(name: name, imageURL: url, id: id)
                    }
                }
            }
            /*
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
            
            */
            
        } else {
        }
    }
    
    func seedNewUserFromFacebook(name: String, imageURL: String, id: String) {
        let realm = try! Realm(configuration: configApp)
        let app = realm.object(ofType: App.self, forPrimaryKey: 0)
        let newUser = User()
        //print(actualInfo)
        
        newUser.userID = Int(id)!
        newUser.facebookID = Int(id)!
        newUser.name = name
        newUser.iconURL = imageURL
        print(newUser)
        
        try! realm.write {
            app?.activeUser = Int(id)!
            realm.add(newUser,
                      update: true)
        }
        
        let iconData = getUserIcon(iconURL: newUser.iconURL)
        
        try! realm.write {
            
            newUser.icon = iconData
        }
        print("After getting image \(newUser)")
        
        loginToUserRealm(user: newUser.userID)
    }
    
    func getUserIcon(iconURL: String) -> NSData {
        let url = URL(string: iconURL)
        let data = try? Data(contentsOf: url!)
        
        return data! as NSData
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
    
    func exitModalView() {
        print("exiting")
        self.dismiss(animated: true, completion: { self.placesView.reloadView()})
    }
    
}
