//
//  PlacesView.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/11/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import RealmSwift

class AccountView: UIViewController {
    var notificationToken: NotificationToken? = nil
    var subviewFrame = CGRect()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        isUserLoggedIn()
    }
    
    func setupNavigation() {
        
        self.title = "My Account"
        self.view.backgroundColor = .white
        self.navigationController?.isToolbarHidden = false
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let logout = UIBarButtonItem(title: "Logout",
                                     style: .plain,
                                     target: self,
                                     action: #selector(logoutUser))
        let query = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(queryAllUsers))
        
        self.toolbarItems = [spacer, logout, spacer, query]
        
    }
    
    func isUserLoggedIn() {
        print("Current User: \(String(describing: SyncUser.current))")
        
        if SyncUser.current == nil {
            self.view.addSubview(loginView())
            
        } else {
            attemptToRender()
        }
    }
    
    func logoutUser() {
        logoutOfAllRealmUsers()
        reloadView()
        
    }
    
    func reloadView() {
        
        self.loadView()
        self.viewDidLoad()
    }
    
    func attemptToRender() {
        let realm = try! Realm(configuration: configUser)
        let myID = realm.objects(User.self).first?.heepID
        
        if myID == nil {
            print("Couldn't grab ID from logged in realm.... logging out")
            logoutUser()
            self.reloadView()
            return
        }
        
        let realmPublic = try! Realm(configuration: configPublicSync)
        let myUserData = realmPublic.object(ofType: User.self, forPrimaryKey: myID)
       
        
        let loginGroup = DispatchGroup()
        loginGroup.enter()
        
        DispatchQueue.global(qos: .default).sync {
            if myUserData == nil {
                seedNewUserAccount(heepID: myID!,
                                   callback: { loginGroup.leave() },
                                   repair: true)
            } else {
                loginGroup.leave()
            }
        }
        
        loginGroup.wait()
        
        self.view.addSubview(alreadyLoggedInView())
    }
    
}

// Already Logged in View 

extension AccountView {
    func alreadyLoggedInView() -> UIView {
        let userAccountView = UIView()
        
        let iconView = userIconView()
        let nameView = userNameView(frame: iconView.frame)
        let emailView = userEmailView(frame: nameView.frame)
        
        userAccountView.addSubview(iconView.view)
        userAccountView.addSubview(nameView.view)
        userAccountView.addSubview(emailView.view)
        
        return userAccountView
    }
    
    func userIconView() -> (view: UIView, frame: CGRect) {
        let iconDiameter = self.view.frame.width / 5
        let realm = try! Realm(configuration: configUser)
        let myID = realm.objects(User.self).first?.heepID

        let frame = CGRect(x: (self.view.frame.width / 2) - (iconDiameter / 2),
                           y: (iconDiameter / 4),
                           width: iconDiameter,
                           height: iconDiameter)

        let containerView = UIView(frame: frame)
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = containerView.frame.width / 2
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1
        
        let iconView = UIImageView(frame: containerView.bounds)
        iconView.image = myImage(userID: myID!)
        iconView.contentMode = .scaleAspectFit
        
        containerView.addSubview(iconView)
        
        return (view: containerView, frame: frame)
    }
    
    func userNameView(frame: CGRect)  -> (view: UIView, frame: CGRect) {
        let nextFrame = CGRect(x: 0,
                               y: frame.maxY + 10,
                               width: self.view.frame.width,
                               height: frame.height / 3)
        
        let userNameView = UILabel(frame: nextFrame)
        userNameView.text = myName()
        userNameView.adjustsFontSizeToFitWidth = true
        userNameView.textColor = .darkGray
        userNameView.textAlignment = .center
        userNameView.contentMode = .bottom
        
        return (view: userNameView, frame: nextFrame)
    }
    
    func myName() -> String {
        let myProfile = retrieveUserProfile()
        return myProfile.name
    }
    
    func retrieveUserProfile() -> User {
        
        var publicRealm = try! Realm(configuration: configPublicSync)
        var userRealm = try! Realm(configuration: configUser)
        
        let myId = userRealm.objects(User.self).first?.heepID
        return publicRealm.object(ofType: User.self, forPrimaryKey: myId!)!
    }
    
    
    func userEmailView(frame: CGRect) -> (view: UIView, frame: CGRect) {
        let nextFrame = CGRect(x: 0,
                               y: frame.maxY,
                               width: self.view.frame.width,
                               height: frame.height)
        
        let emailView = UILabel(frame: nextFrame)
        emailView.text = myEmail()
        emailView.adjustsFontSizeToFitWidth = true
        emailView.textColor = .lightGray
        emailView.textAlignment = .center
        emailView.contentMode = .top
        
        return (view: emailView, frame: nextFrame)
    }
    
    func myEmail() -> String {
        let myProfile = retrieveUserProfile()
        return myProfile.email
    }
}

// NO USER LOGGED IN

extension AccountView{
    func loginView() -> UIView {
        
        self.subviewFrame = CGRect(x: 0,
                                   y: 0,
                                   width: self.view.frame.width,
                                   height: self.view.frame.height)
        
        let subview = UIView(frame: subviewFrame)
        subview.addGestureRecognizer(UITapGestureRecognizer(target: nil, action: nil))
        subview.backgroundColor = .white
        subview.layer.cornerRadius = 5
        subview.clipsToBounds = true
        
        let startFrame = CGRect(x: 20,
                                y: 50,
                                width: subview.frame.width - 40,
                                height: 35)
        
        
        let registrationButton = addRegistrationButton(frame: startFrame,
                                                       sender: self,
                                                       action: #selector(handleRegistration) )
        
        let instructionLabel = addTextInstruction(frame: registrationButton.frame,
                                                  text: "- or -")
        
        let loginLabel = addTextInstruction(frame: instructionLabel.frame,
                                                  text: "Log in to Existing Account")
        
        let emailTextBox = addEmailTextBox(frame: loginLabel.frame)
        let passwordTextBox = addPasswordTextBox(frame: emailTextBox.frame)
        let cancelButton = addCancelButton(frame: passwordTextBox.frame, sender: self, action: #selector(exitView))
        let submitButton = addSubmitButton(frame: cancelButton.frame, sender: self, action: #selector(submitValues))
        
        
        
        subview.addSubview(loginLabel.view)
        subview.addSubview(emailTextBox.view)
        subview.addSubview(passwordTextBox.view)
        subview.addSubview(cancelButton.view)
        subview.addSubview(submitButton.view)
        subview.addSubview(instructionLabel.view)
        subview.addSubview(registrationButton.view)
        
        return subview
    }
    
    func submitValues() {
        let inputResults = extractInputValues()
        
        let loginGroup = DispatchGroup()
        loginGroup.enter()
        
        DispatchQueue.global(qos: .default).sync {
            loginToUserRealmSync(username: inputResults.email,
                                 password: inputResults.password,
                                 callback: { loginGroup.leave()})
            
        }
        
        loginGroup.wait()
        
        validateUser()
        
        
    }
    
    func handleRegistration() {
        print("REGISTER!")
    }
    
    func validateUser() {
        if SyncUser.all.count > 1 {
            
            print("Logging out of public")
            validateUser()
        } else {
            if SyncUser.current != nil {
                let alert = easyAlert(message: "Login Successful!")
                present(alert, animated: false, completion: nil)
                
            } else {
                let alert = UIAlertController(title: "Alert",
                                              message: "Could Not find Realm. Would you like to register a new account using these credentials?",
                                              preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                    
                    let inputResults = self.extractInputValues()
                    seedNewUserAccount(name: "Jacob Keith",
                                       email: inputResults.email,
                                       password: inputResults.password)
                    
                    self.submitValues()
                }))
                
                alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { action in
                    self.exitView()
                }))
                present(alert, animated: false, completion: nil)
            }
        }
        
    }
    
    func extractInputValues() -> (email: String, password: String) {
        var email = "0"
        var password = "0"
        
        for subview in self.view.subviews {
            for subsubview in subview.subviews {
                for subsubsubview in subsubview.subviews {
                    if let textField = subsubsubview as? UITextField {
                        if textField.tag == 0 {
                            email = textField.text!
                            
                        } else if textField.tag == 1 {
                            password = textField.text!
                        }
                    }
                }
            }
        }
        
        return (email: email, password: password)
    }
    
    func exitView() {
        self.navigationController?.popViewController(animated: false)

    }
    
    func queryAllUsers() {
        queryAllUser()
    }

}
