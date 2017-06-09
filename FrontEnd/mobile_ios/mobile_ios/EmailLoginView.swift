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
                                         keyboardType: .emailAddress)
        
        newUserInputFrame = CGRect(x: newUserInputFrame.minX,
                                   y: newUserInputFrame.minY + 45,
                                   width: newUserInputFrame.width,
                                   height: newUserInputFrame.height)
        
        let passwordTextBox = insetTextView(frame: newUserInputFrame,
                                            placeholderText: "password",
                                            secure: true)
        
        subview.addSubview(addTitle())
        subview.addSubview(emailTextBox)
        subview.addSubview(passwordTextBox)
        
        self.view.addSubview(subview)
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
