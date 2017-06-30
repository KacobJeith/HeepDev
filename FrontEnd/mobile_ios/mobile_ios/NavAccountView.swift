//
//  PlacesView.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/11/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import RealmSwift

class NavAccountView: UIViewController {
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

extension NavAccountView {
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

extension NavAccountView {
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
                                y: 150,
                                width: subview.frame.width - 40,
                                height: 35)
        
        let emailTextBox = addEmailTextBox(frame: startFrame)
        let passwordTextBox = addPasswordTextBox(frame: emailTextBox.frame)
        let cancelButton = addCancelButton(frame: passwordTextBox.frame)
        let submitButton = addSubmitButton(frame: cancelButton.frame)
        
        subview.addSubview(emailTextBox.view)
        subview.addSubview(passwordTextBox.view)
        subview.addSubview(cancelButton.view)
        subview.addSubview(submitButton.view)
        
        return subview
    }
    
    func addTitle() -> UILabel {
        let title = UILabel(frame: CGRect(x: 0,
                                          y: 0,
                                          width: subviewFrame.width,
                                          height: 50))
        title.text = "Login Using Email"
        title.adjustsFontSizeToFitWidth = true
        title.contentMode = .center
        title.textAlignment = .center
        title.textColor = UIColor.darkGray
        
        return title
    }
    
    func addEmailTextBox(frame: CGRect) -> (view: UIView, frame: CGRect) {
        let view = insetTextView(frame: frame,
                                 placeholderText: "email",
                                 keyboardType: .emailAddress,
                                 tag: 0)
        
        return (view: view, frame: frame)
        
    }
    
    func addPasswordTextBox(frame: CGRect) -> (view: UIView, frame: CGRect) {
        let nextFrame = CGRect(x: frame.minX,
                               y: frame.maxY + 10,
                               width: frame.width,
                               height: frame.height)
        
        let view = insetTextView(frame: nextFrame,
                                 placeholderText: "password",
                                 secure: true,
                                 tag: 1)
        
        return (view: view, frame: nextFrame)
    }
    
    func addCancelButton(frame: CGRect) -> (view: UIButton, frame: CGRect) {
        let nextFrame = CGRect(x: frame.minX,
                               y: frame.maxY + 10,
                               width: frame.width / 2 - 5,
                               height: frame.height)
        
        let cancelButton = createActionButton(frame: nextFrame,
                                              title: "cancel",
                                              action: #selector(exitView))
        
        return (view: cancelButton, frame: nextFrame)
    }
    
    func addSubmitButton(frame: CGRect) -> (view: UIButton, frame: CGRect) {
        let nextFrame = CGRect(x: frame.maxX + 10,
                               y: frame.minY,
                               width: frame.width,
                               height: frame.height)
        
        let submitButton = createActionButton(frame: nextFrame,
                                              title: "submit",
                                              action: #selector(submitValues))
        
        return (view: submitButton, frame: nextFrame)
        
    }
    
    func createActionButton(frame: CGRect, title: String, action: Selector) -> UIButton {
        let button = UIButton(frame: frame)
        button.setTitle(title, for: .normal)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = UIColor(white: 0.85, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self,
                         action: action,
                         for: .primaryActionTriggered)
        
        return button
    }
    
    func submitValues() {
        let inputResults = extractInputValues()
        //let pseudoUniqueID = getIDFromByteArray(bytes: inputResults.email.asciiArray)
        //seedNewUserAccount(name: "placeholder", id: String(describing: pseudoUniqueID), email: inputResults.email, password: inputResults.password)
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
    
    func validateUser() {
        if SyncUser.all.count > 1 {
            //logoutOfPublicRealmUser()
            print("Logging out of public")
            validateUser()
        } else {
            if SyncUser.current != nil {
                let alert = UIAlertController(title: "Alert",
                                              message: "Successfully Logged in to Realm",
                                              preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: { action in
                    self.exitView()
                }))
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
