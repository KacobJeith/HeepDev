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
        
        let emailTextBox = addEmailTextField()
        
        subview.addSubview(emailTextBox)
        
        self.view.addSubview(subview)
    }
    
    func addEmailTextField() -> UIView {
        let insetView = UIView(frame: CGRect(x: 40,
                                             y: 40,
                                             width: subviewFrame.width - 80,
                                             height: 35))
        insetView.backgroundColor = UIColor(white: 0.9, alpha: 1)
        insetView.layer.cornerRadius = 5
        
        let emailTextField: UITextField = {
            let text = UITextField()
            text.frame = CGRect(x: 10,
                                y: 2.5,
                                width: insetView.frame.width - 20,
                                height: insetView.frame.height - 5)
            
            text.placeholder = "email"
            text.textColor = UIColor.darkGray
            text.keyboardType = .emailAddress
            
            return text
        }()
        
        insetView.addSubview(emailTextField)
        return insetView
    }
    
    
}
