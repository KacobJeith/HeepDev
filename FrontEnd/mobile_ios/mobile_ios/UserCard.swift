//
//  UserCard.swift
//  mobile_ios
//
//  Created by Jacob on 6/30/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit

func generateUserCard(frame: CGRect, profile: User) -> UIView {
    let userAccountView = UIView()
    
    let iconView = userIconView(startingframe: frame, userID: profile.heepID)
    let nameView = userNameView(frame: iconView.frame, name: profile.name)
    let emailView = userEmailView(frame: nameView.frame, email: profile.email)
    
    userAccountView.addSubview(iconView.view)
    userAccountView.addSubview(nameView.view)
    userAccountView.addSubview(emailView.view)
    
    return userAccountView
}

func userIconView(startingframe: CGRect, userID: Int) -> (view: UIView, frame: CGRect) {
    let iconDiameter = startingframe.width * 0.8 //UIScreen.main.width / 5
    
    let frame = CGRect(x: (startingframe.width / 2) - (iconDiameter / 2),
                       y: 5,
                       width: iconDiameter,
                       height: iconDiameter)
    
    let containerView = UIView(frame: frame)
    containerView.backgroundColor = .white
    containerView.layer.cornerRadius = containerView.frame.width / 2
    containerView.layer.borderColor = UIColor.lightGray.cgColor
    containerView.layer.borderWidth = 1
    containerView.clipsToBounds = true
    
    let iconView = database().downloadMyProfileImage(heepID: userID)
    iconView.frame = CGRect(x: 0, y: 0,
                            width: iconDiameter,
                            height: iconDiameter)
    
    iconView.contentMode = .scaleAspectFit
    
    containerView.addSubview(iconView)
    
    return (view: containerView, frame: frame)
}

func userNameView(frame: CGRect, name: String, textAlignment: NSTextAlignment = .center, calculateFrame: Bool = true)  -> (view: UIView, frame: CGRect) {
    var nextFrame = frame
    
    if calculateFrame {
        nextFrame = CGRect(x: 0,
                           y: frame.maxY + 3,
                           width: frame.width,
                           height: 10)
    }
    
    
    let userNameView = UILabel(frame: nextFrame)
    userNameView.text = name
    userNameView.font = userNameView.font.withSize(12)
    userNameView.textColor = .darkGray
    userNameView.textAlignment = textAlignment
    userNameView.contentMode = .bottom
    
    return (view: userNameView, frame: nextFrame)
}

func userEmailView(frame: CGRect, email: String, textAlignment: NSTextAlignment = .center, calculateFrame: Bool = true) -> (view: UIView, frame: CGRect) {
    var nextFrame = frame
    
    if calculateFrame {
        nextFrame = CGRect(x: 0,
                           y: frame.maxY + 3,
                           width: frame.width,
                           height: frame.height)
    }
    
    let emailView = UILabel(frame: nextFrame)
    emailView.text = email
    emailView.font = emailView.font.withSize(12)
    emailView.textColor = .lightGray
    emailView.textAlignment = textAlignment
    emailView.contentMode = .top
    
    return (view: emailView, frame: nextFrame)
}

