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
    var startFrame = CGRect()
    var registeringNewAccount: Bool = false
    var currentPage: Int = 0
    
    var email: String? = ""
    var password: String? = ""
    var passwordCheck: String? = ""
    var name: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.subviewFrame = CGRect(x: 0,
                                   y: 0,
                                   width: self.view.frame.width,
                                   height: self.view.frame.height)
        
        self.startFrame = CGRect(x: 20,
                                 y: 0,
                                 width: subviewFrame.width - 40,
                                 height: 35)
    
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
        
        database().signOut()
        reloadView()
        
    }
    
    func reloadView() {
        
        self.loadView()
        self.viewDidLoad()
    }
    
    func attemptToRender() {
        let realm = try! Realm(configuration: configUser)
        
        if let myID = realm.objects(User.self).first?.heepID {
            
            print("GOT AN ID: \(myID)")
            self.view.addSubview(alreadyLoggedInView())
            
        } else {
            print("Couldn't grab ID from logged in realm.... logging out")
            //logoutUser()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: {
                print("Trying... \(DispatchTime.now())")
                self.reloadView()
                return
            })
        }
        
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
        if let myProfile = retrieveUserProfile() {
            
            return myProfile.name
        } else {
            return "nil"
        }
    }
    
    func retrieveUserProfile() -> User? {
        
        let publicRealm = try! Realm(configuration: configPublicSync)
        let userRealm = try! Realm(configuration: configUser)
        
        if let myId = userRealm.objects(User.self).first?.heepID {
            if let profile = publicRealm.object(ofType: User.self, forPrimaryKey: myId) {
                return profile
                
            } else {
                
                return nil
            }
        } else {
            print("Could not find ID")
            return nil
        }
        
            
        
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
        if let myProfile = retrieveUserProfile() {
            
            return myProfile.email
        } else {
            return "nil"
        }
    }
}

// NO USER LOGGED IN

extension AccountView{
    func loginView() -> UIView {
        
        let subview = UIView(frame: subviewFrame)
        subview.addGestureRecognizer(UITapGestureRecognizer(target: nil, action: nil))
        subview.backgroundColor = .white
        subview.layer.cornerRadius = 5
        subview.clipsToBounds = true
        
        let registrationButton = addRegistrationButton(frame: startFrame,
                                                       sender: self,
                                                       action: #selector(handleRegistration) )
        
        let instructionLabel = addTextInstruction(frame: registrationButton.frame,
                                                  text: "- or -")
        
        let loginLabel = addTextInstruction(frame: instructionLabel.frame,
                                                  text: "Log in to Existing Account")
        
        let emailTextBox = addEmailTextBox(frame: loginLabel.frame, lastAttempt: email)
        let passwordTextBox = addPasswordTextBox(frame: emailTextBox.frame, lastAttempt: password)
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
        print("submitting \(String(describing: email))")
        
        let loginGroup = DispatchGroup()
        loginGroup.enter()
        
        DispatchQueue.global(qos: .default).sync {
            guard let email = email else {
                
                present(easyAlert(message: "Please input your email!", callback: {self.reloadView()}), animated: false, completion: nil)
                loginGroup.leave()
                return
            }
            
            guard let password = password else {
                present(easyAlert(message: "Please input your password!", callback: {self.reloadView()}), animated: false, completion: nil)
                loginGroup.leave()
                return
                
            }
            
            loginToUserRealmSync(username: email,
                                 password: password,
                                 callback: {
                                    print("Executing Callback")
                                    loginGroup.leave()
            })
            
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
                                  callback: { self.reloadView()}),
                        animated: false, completion: nil)
            } else {
                
                present(easyAlert(message: "Try Again. Email or Password invalid.", callback: {self.reloadView()}),
                        animated: false,
                        completion: nil)
            }
        }
        
    }
    
    func extractInputValues(inputs: [String] = ["name", "email", "password", "passwordCheck"]) {
        resetExtractionValues(inputs: inputs)
        
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
    
    func resetExtractionValues(inputs: [String]) {
        
        for input in inputs {
            switch input {
            case "email" : email = nil
            case "name" : name = nil
            case "password" : password = nil
            case "passwordCheck" : passwordCheck = nil
            default : break
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
        
        switch currentPage {
        case 0 :
            return inputNameAndEmailPage()
            
        case 1 :
            return inputPasswordsPage()
            
        default :
            
            return UIView()
        }
        
    }
    
    func inputNameAndEmailPage() -> UIView {
        
        let subview = UIView(frame: subviewFrame)
        subview.addGestureRecognizer(UITapGestureRecognizer(target: nil, action: nil))
        
        let instructionLabel = addTextInstruction(frame: startFrame,
                                                  text: "Enter your Name and Email")
        
        let nameTextBox = addNameTextBox(frame: instructionLabel.frame, lastAttempt: name)
        let emailTextBox = addEmailTextBox(frame: nameTextBox.frame, lastAttempt: email)
        
        let cancelButton = addCancelButton(frame: getNextFrame(frame: emailTextBox.frame), sender: self, action: #selector(exitRegistrationBackToLogin))
        let submitButton = addNextButton(frame: cancelButton.frame, sender: self, action: #selector(submitNameAndEmail))
        
        subview.addSubview(instructionLabel.view)
        subview.addSubview(nameTextBox.view)
        subview.addSubview(emailTextBox.view)
        subview.addSubview(cancelButton.view)
        subview.addSubview(submitButton.view)
        
        
        return subview
    }
    
    func inputPasswordsPage() -> UIView {
        
        let subview = UIView(frame: subviewFrame)
        subview.addGestureRecognizer(UITapGestureRecognizer(target: nil, action: nil))
        
        
        let instructionLabel = addTextInstruction(frame: startFrame,
                                                  text: "Enter and Verify Account Password")
        let passwordTextBox = addPasswordTextBox(frame: instructionLabel.frame, lastAttempt: password)
        let retypePasswordTextBox = addPasswordCheckTextBox(frame: passwordTextBox.frame, lastAttempt: passwordCheck)
        let cancelButton = addCancelButton(frame: getNextFrame(frame: retypePasswordTextBox.frame), sender: self, action: #selector(exitRegistrationBackToLogin))
        let submitButton = addSubmitButton(frame: cancelButton.frame, sender: self, action: #selector(submitRegistrationForm))
        
        subview.addSubview(instructionLabel.view)
        subview.addSubview(passwordTextBox.view)
        subview.addSubview(retypePasswordTextBox.view)
        subview.addSubview(cancelButton.view)
        subview.addSubview(submitButton.view)
        
        
        return subview
    }
    
    func submitNameAndEmail() {
        extractInputValues(inputs: ["name", "email"])
        
        guard let name = name else {
            present(easyAlert(message: "Don't forget your name!",
                              callback: {self.reloadView()}),
                    animated: false, completion: nil)
            return
        }
        
        guard let email = email else {
            present(easyAlert(message: "Sorry...invalid email",
                              callback: {self.reloadView()}),
                    animated: false, completion: nil)
            return
        }
        
        currentPage += 1
        print("Creating \(name)'s account with email: \(email)")
        
        self.reloadView()
    }
    
    func submitRegistrationForm() {
        extractInputValues(inputs: ["password", "passwordCheck"])
        
        
        guard let name = name else {
            present(easyAlert(message: "Don't forget your name!",
                              callback: {self.reloadView()}),
                    animated: false, completion: nil)
            return
        }
        
        guard let email = email else {
            present(easyAlert(message: "Sorry...invalid email",
                              callback: {self.reloadView()}),
                    animated: false, completion: nil)
            return
        }
        
        guard let password = password else {
            present(easyAlert(message: "Forgot to input a password!",
                              callback: {self.reloadView()}),
                    animated: false, completion: nil)
            return
        }
        
        guard let passwordCheck = passwordCheck else {
            present(easyAlert(message: "Forgot to input the verification password >_<",
                              callback: {self.reloadView()}),
                    animated: false, completion: nil)
            return
        }
        
        if password == passwordCheck {
            present(easyAlert(message: "Creating your new Heep Account!",
                              callback: {self.reloadView()}),
                    animated: false, completion: nil)
            
            
            let newUser = User()
            newUser.heepID = randomNumber(inRange: 1...1000000)
            newUser.name = name
            newUser.iconURL = "https://lorempixel.com/400/400/"
            newUser.email = email
            newUser.icon = getUserIcon(iconURL: newUser.iconURL)
            
            database().registerNewUser(user: newUser,
                                       email: email,
                                       password: password)
            
            
            self.submitLogin()
            
        } else {
            
            self.password = nil
            self.passwordCheck = nil
            
            present(easyAlert(message: "Passwords don't match =/",
                              callback: {self.reloadView()}),
                    animated: false, completion: nil)
        }
        
    }
    
    func exitRegistrationBackToLogin() {
        registeringNewAccount = false
        self.reloadView()
    }

}
