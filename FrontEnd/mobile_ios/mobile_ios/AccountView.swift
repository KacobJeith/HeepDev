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
    var registeringNewAccount: Bool = false
    
    var email: String? = nil
    var password: String? = nil
    var passwordCheck: String? = nil
    var name: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.navigationController?.isToolbarHidden = false
        isUserLoggedIn()
    }
    
    func setupNavigation() {
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let logout = UIBarButtonItem(title: "Logout",
                                     style: .plain,
                                     target: self,
                                     action: #selector(logoutUser))
        
        self.toolbarItems = [spacer, logout, spacer]
        
    }
    
    func isUserLoggedIn() {
        print("Current User: \(String(describing: SyncUser.current))")
        
        if SyncUser.current == nil {
            if registeringNewAccount {
                self.title = "Register New Account"
                self.view.addSubview(registerView())
            } else {
                self.title = "Login to Heep"
                self.view.addSubview(loginView())
            }
            
        } else {
            self.title = "My Account"
            setupNavigation()
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
        
        let publicRealm = try! Realm(configuration: configPublicSync)
        let userRealm = try! Realm(configuration: configUser)
        
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
        let submitButton = addSubmitButton(frame: cancelButton.frame, sender: self, action: #selector(submitLogin))
        
        
        
        subview.addSubview(loginLabel.view)
        subview.addSubview(emailTextBox.view)
        subview.addSubview(passwordTextBox.view)
        subview.addSubview(cancelButton.view)
        subview.addSubview(submitButton.view)
        subview.addSubview(instructionLabel.view)
        subview.addSubview(registrationButton.view)
        
        return subview
    }
    
    func submitLogin() {
        extractInputValues()
        print("submitting \(email)")
        
        let loginGroup = DispatchGroup()
        loginGroup.enter()
        
        DispatchQueue.global(qos: .default).sync {
            guard let email = email else {
                
                present(easyAlert(message: "Please input your email!"), animated: false, completion: nil)
                loginGroup.leave()
                return
            }
            
            guard let password = password else {
                present(easyAlert(message: "Please input your password!"), animated: false, completion: nil)
                loginGroup.leave()
                return
                
            }
            
            loginToUserRealmSync(username: email,
                                 password: password,
                                 callback: { loginGroup.leave()})
            
        }
        
        loginGroup.wait()
        
        self.validateUser()
        
    }
    
    func handleRegistration() {
        print("REGISTER!")
        registeringNewAccount = true
        self.reloadView()
    }
    
    func validateUser() {
        if SyncUser.all.count > 1 {
            
            print("Logging out of public")
            validateUser()
        } else {
            if SyncUser.current != nil {
                
                present(easyAlert(message: "Login Successful!",
                                  callback: { self.exitView()}),
                        animated: false, completion: nil)
            } else {
                
                present(easyAlert(message: "Try Again. Email or Password invalid."),
                        animated: false,
                        completion: nil)
            }
        }
        
    }
    
    func extractInputValues() {
        print("extracting \(email)")
        
        email = nil
        name = nil
        password = nil
        passwordCheck = nil
        
        for subview in self.view.subviews {
            for subsubview in subview.subviews {
                for subsubsubview in subsubview.subviews {
                    if let textField = subsubsubview as? UITextField {
                        
                        checkStatusOfTextBox(textField: textField)
                    }
                }
            }
        }
        
        
    }
    
    func exitView() {
        self.navigationController?.popViewController(animated: false)

    }
    
    func checkStatusOfTextBox(textField: UITextField)  {
        
        guard let text = textField.text else {
            return
        }
        
        var doubleCheckedText: String? = nil
        
        if text != "" {
            doubleCheckedText = text
        }
        
        switch textField.tag {
        case 0 :
            
            email = doubleCheckedText
        case 1 :
            password = doubleCheckedText
        case 2 :
            passwordCheck = doubleCheckedText
        case 3 :
            name = doubleCheckedText
        default :
            return
        }
        
    }
    
}



//registering new account view
extension AccountView {
    func registerView() -> UIView {
        
        self.subviewFrame = CGRect(x: 0,
                                   y: 0,
                                   width: self.view.frame.width,
                                   height: self.view.frame.height)
        
        let subview = UIView(frame: subviewFrame)
        subview.addGestureRecognizer(UITapGestureRecognizer(target: nil, action: nil))
        
        
        let startFrame = CGRect(x: 20,
                                y: 50,
                                width: subview.frame.width - 40,
                                height: 35)
        
        
        
        let nameTextBox = addNameTextBox(frame: startFrame)
        let emailTextBox = addEmailTextBox(frame: nameTextBox.frame)
        
        let passwordTextBox = addPasswordTextBox(frame: getNextFrame(frame: emailTextBox.frame))
        let retypePasswordTextBox = addPasswordCheckTextBox(frame: passwordTextBox.frame)
        
        let cancelButton = addCancelButton(frame: getNextFrame(frame: retypePasswordTextBox.frame), sender: self, action: #selector(exitRegistrationBackToLogin))
        let submitButton = addSubmitButton(frame: cancelButton.frame, sender: self, action: #selector(submitRegistrationForm))
        
        
        subview.addSubview(nameTextBox.view)
        subview.addSubview(emailTextBox.view)
        subview.addSubview(passwordTextBox.view)
        subview.addSubview(retypePasswordTextBox.view)
        
        subview.addSubview(cancelButton.view)
        subview.addSubview(submitButton.view)
        
        
        return subview
    }
    
    func submitRegistrationForm() {
        extractInputValues()
        
        
        guard let password = password else {
            present(easyAlert(message: "You forgot to input a password!"), animated: false, completion: nil)
            return
        }
        
        guard let passwordCheck = passwordCheck else {
            present(easyAlert(message: "You forgot to input the verification password >_<"), animated: false, completion: nil)
            return
        }
        
        guard let name = name else {
            present(easyAlert(message: "You forgot to tell us who you are!"), animated: false, completion: nil)
            return
        }
        
        guard let email = email else {
            present(easyAlert(message: "Invalid email"), animated: false, completion: nil)
            return
        }
        
        print(password)
        print(name)
        print(email)
        print(passwordCheck)
        
//        if password == passwordCheck {
//            present(easyAlert(message: "Passwords match!"), animated: false, completion: nil)
////            seedNewUserAccount(name: inputResults.name,
////                               email: inputResults.email,
////                               password: inputResults.password)
////            
////            self.submitLogin()
//        } else {
//            
//            present(easyAlert(message: "Passwords don't match"), animated: false, completion: nil)
//        }
        
    }
    
    func exitRegistrationBackToLogin() {
        registeringNewAccount = false
        self.reloadView()
    }

}
