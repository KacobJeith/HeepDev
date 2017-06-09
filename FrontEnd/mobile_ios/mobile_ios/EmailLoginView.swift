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
        
        let newUserInputFrame = CGRect(x: 20,
                                       y: 60,
                                       width: subview.bounds.width - 40,
                                       height: 35)
        
        let emailTextBox = insetTextView(frame: newUserInputFrame,
                                         placeholderText: "email",
                                         keyboardType: .emailAddress)
        
        subview.addSubview(emailTextBox)
        
        self.view.addSubview(subview)
    }
    
    
    
    
}
