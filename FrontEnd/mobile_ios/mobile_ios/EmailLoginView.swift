//
//  EmailLoginView.swift
//  mobile_ios
//
//  Created by Jacob on 6/7/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import RealmSwift

class EmailLoginView : UIViewController {
    
    var subviewFrame = CGRect()
    var userEmail = String()
    var userPassword = String()
    
    init(frame: CGRect) {
        super.init(nibName: nil, bundle: nil)
        print(frame)
        self.subviewFrame = frame
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                              action: #selector(exitModalView)))
        self.view.addSubview(addSubview())
    }
    
    func addSubview() -> UIView {
        let subview = UIView(frame: subviewFrame)
        subview.addGestureRecognizer(UITapGestureRecognizer(target: nil, action: nil))
        subview.backgroundColor = .white
        subview.layer.cornerRadius = 5
        subview.clipsToBounds = true
        
        let startFrame = CGRect(x: 20,
                                y: (subview.bounds.height / 2) - 40,
                                width: subview.bounds.width - 40,
                                height: 35)
        
        let emailTextBox = addEmailTextBox(frame: startFrame)
        let passwordTextBox = addPasswordTextBox(frame: emailTextBox.frame)
        let cancelButton = addCancelButton(frame: passwordTextBox.frame)
        let submitButton = addSubmitButton(frame: cancelButton.frame)
        
        subview.addSubview(addTitle())
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
                                              action: #selector(exitModalView))
        
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
    
    func submitValues(gesture: UITapGestureRecognizer) {
        let inputResults = extractInputValues()
        print("Final results... \(inputResults.email), \(inputResults.password)")
        let hashed = hashString(name: "SHA1", string: inputResults.email)
        print("Hashed...\(hashed! as NSData)")
        print()
        let pseudoUniqueID = getIDFromByteArray(bytes: inputResults.email.asciiArray)
        seedNewUserAccount(name: "placeholder", id: String(describing: pseudoUniqueID))
        loginToUserRealm(user: pseudoUniqueID)
        exitModalView()
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
    
    
    
    
    func exitModalView() {
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
    
}
