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
        
        let subview = UIView(frame: subviewFrame)
        subview.addGestureRecognizer(UITapGestureRecognizer(target: nil, action: nil))
        subview.backgroundColor = .white
        subview.layer.cornerRadius = 5
        subview.clipsToBounds = true
        
        var newUserInputFrame = CGRect(x: 20,
                                       y: (subview.bounds.height / 2) - 40,
                                       width: subview.bounds.width - 40,
                                       height: 35)
        
        let emailTextBox = insetTextView(frame: newUserInputFrame,
                                         placeholderText: "email",
                                         keyboardType: .emailAddress,
                                         tag: 0)
        
        newUserInputFrame = CGRect(x: newUserInputFrame.minX,
                                   y: newUserInputFrame.maxY + 10,
                                   width: newUserInputFrame.width,
                                   height: newUserInputFrame.height)
        
        let passwordTextBox = insetTextView(frame: newUserInputFrame,
                                            placeholderText: "password",
                                            secure: true,
                                            tag: 1)
        
        newUserInputFrame = CGRect(x: newUserInputFrame.minX,
                                   y: newUserInputFrame.maxY + 10,
                                   width: newUserInputFrame.width / 2 - 5,
                                   height: newUserInputFrame.height)
        
        let cancelButton = createActionButton(frame: newUserInputFrame, title: "cancel", action: #selector(exitModalView))
        
        newUserInputFrame = CGRect(x: newUserInputFrame.maxX + 10,
                                   y: newUserInputFrame.minY,
                                   width: newUserInputFrame.width,
                                   height: newUserInputFrame.height)
        
        let submitButton = createActionButton(frame: newUserInputFrame, title: "submit", action: #selector(submitValues))
        
        subview.addSubview(addTitle())
        subview.addSubview(emailTextBox)
        subview.addSubview(passwordTextBox)
        subview.addSubview(cancelButton)
        subview.addSubview(submitButton)
        
        //subview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(submitValues)))
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(exitModalView)))
        self.view.addSubview(subview)
    }
    
    func createActionButton(frame: CGRect, title: String, action: Selector) -> UIButton {
        let button = UIButton(frame: frame)
        button.setTitle(title, for: .normal)
        button.contentHorizontalAlignment = .center
        button.backgroundColor = UIColor(white: 0.85, alpha: 1)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: action, for: .primaryActionTriggered)
        
        return button
    }
    
    func submitValues(gesture: UITapGestureRecognizer) {
        let inputResults = extractInputValues()
        print("Final results... \(inputResults.email), \(inputResults.password)")
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
    
    func exitModalView() {
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
    
}
