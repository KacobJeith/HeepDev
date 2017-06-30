//
//  UserCard.swift
//  mobile_ios
//
//  Created by Jacob on 6/30/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import RealmSwift

func generateUserCard(frame: CGRect, userID: Int) -> UIView {
    let userAccountView = UIView()
    
    
    let iconView = userIconView(startingframe: frame, userID: userID)
    let nameView = userNameView(frame: iconView.frame, userID: userID)
    let emailView = userEmailView(frame: nameView.frame, userID: userID)
    
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
    
    let iconView = UIImageView(frame: containerView.bounds)
    iconView.image = #imageLiteral(resourceName: "male")
    iconView.contentMode = .scaleAspectFit
    
    containerView.addSubview(iconView)
    
    return (view: containerView, frame: frame)
}

func userNameView(frame: CGRect, userID: Int)  -> (view: UIView, frame: CGRect) {
    let nextFrame = CGRect(x: 0,
                           y: frame.maxY + 3,
                           width: frame.width,
                           height: 10)
    
    let userNameView = UILabel(frame: nextFrame)
    userNameView.text = myName(userID: userID)
    userNameView.font = userNameView.font.withSize(12)
    userNameView.textColor = .darkGray
    userNameView.textAlignment = .center
    userNameView.contentMode = .bottom
    
    return (view: userNameView, frame: nextFrame)
}

func myName(userID: Int) -> String {
    let myProfile = retrieveUserProfile(userID: userID)
    return myProfile.name
}

func retrieveUserProfile(userID: Int) -> User {
    
    let publicRealm = try! Realm(configuration: configPublicSync)
    return publicRealm.object(ofType: User.self, forPrimaryKey: userID)!
}


func userEmailView(frame: CGRect, userID: Int) -> (view: UIView, frame: CGRect) {
    let nextFrame = CGRect(x: 0,
                           y: frame.maxY + 3,
                           width: frame.width,
                           height: frame.height)
    
    let emailView = UILabel(frame: nextFrame)
    emailView.text = myEmail(userID: userID)
    emailView.font = emailView.font.withSize(12)
    emailView.textColor = .lightGray
    emailView.textAlignment = .center
    emailView.contentMode = .top
    
    return (view: emailView, frame: nextFrame)
}

func myEmail(userID: Int) -> String {
    let myProfile = retrieveUserProfile(userID: userID)
    return myProfile.email
}
