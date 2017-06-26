//
//  ControlPuckCell.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/18/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit
import RealmSwift

func createControlPuck(thisControl: DeviceControl, cellSize: CGRect) -> UIView {
    
    let bigWhiteBox = UIView()
    bigWhiteBox.frame = cellSize
    bigWhiteBox.backgroundColor = .white
    
    let iconName = SuggestIconFromName(name: thisControl.controlName)
    let image = UIImage(named: iconName) as UIImage?
    let deviceSprite = UIButton()
    
    deviceSprite.setBackgroundImage(image, for: [])
    deviceSprite.contentHorizontalAlignment = .center
    deviceSprite.contentMode = .scaleAspectFit
    deviceSprite.frame = CGRect(x: 15, y: 0, width: 50, height: 60)
    
    
    let title = UILabel(frame: CGRect(x:0, y:60, width: cellSize.width, height: 20))
    title.adjustsFontSizeToFitWidth = true
    title.text = thisControl.controlName
    title.textAlignment = .center
    title.adjustsFontSizeToFitWidth = true
    
    
    bigWhiteBox.addSubview(deviceSprite)
    bigWhiteBox.addSubview(title)
    
    return bigWhiteBox
}


func getModeColor(thisGroup: Group, highlight: Bool = false) -> UIColor {
    
    
    if thisGroup.selectedControl == 0 {
        
        if highlight {
            
            return UIColor.purple
            
        } else {
            
            return UIColor.purple.withAlphaComponent(0.4)
        }
        
    } else if thisGroup.selectedControl == 1 {
        if highlight {
            
            return UIColor.green
            
        } else {
            
            return UIColor.green.withAlphaComponent(0.5)
        }
        
    } else if thisGroup.selectedControl == 2 {
        if highlight {
            return UIColor.red
        } else {
            return UIColor.blue.withAlphaComponent(0.6)
        }
        
        
    } else {
        if highlight {
            
            return UIColor.blue
        } else {
            return UIColor.blue.withAlphaComponent(0.3)
        }
    }
    
}


func fitAndCenterImageInView(frame: CGRect, image: UIImage) -> UIImageView {
    
    let imWidth = image.size.width
    let imHeight = image.size.height
    
    let aspectRatio = imWidth / imHeight
    let predictedWidth = aspectRatio * frame.height
    
    let returnView = UIImageView(frame: frame)
    
    if predictedWidth > frame.width {
        
    } else {
        returnView.frame.insetBy(dx: (frame.width / 2) - (predictedWidth / 2),
                                 dy: 0)
    }
    
    returnView.image = image
    returnView.contentMode = .scaleAspectFit
    return returnView
}

func getModeText(thisGroup: Group) -> String {
    
    if thisGroup.selectedControl == 0 {
        
        return " Scrolling "
        
    } else if thisGroup.selectedControl == 1 {
        
        return " Adding "
        
    } else if thisGroup.selectedControl == 2 {
        
        return " Deleting "
    } else {
        
        return " Positioning "
    }
}

func drawLineGeneral(start: CGPoint, finish: CGPoint, color: UIColor = UIColor.black) -> CAShapeLayer {
    let shapeLayer = CAShapeLayer()
    let curve = UIBezierPath()
    
    curve.move(to: start)
    curve.addLine(to: finish)
    shapeLayer.path = curve.cgPath
    
    shapeLayer.strokeColor = color.cgColor
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.lineWidth = 3.0
    
    return shapeLayer
}

func insetTextView(frame: CGRect, placeholderText: String, keyboardType: UIKeyboardType = .default, secure: Bool = false, tag: Int = 0) -> UIView {
    let insetView = UIView(frame: frame)
    insetView.backgroundColor = UIColor(white: 0.9, alpha: 1)
    insetView.layer.cornerRadius = 5
    
    let emailTextField: UITextField = {
        let text = UITextField()
        text.frame = CGRect(x: 10,
                            y: 2.5,
                            width: insetView.frame.width - 20,
                            height: insetView.frame.height - 5)
        text.autocapitalizationType = .none
        text.placeholder = placeholderText
        text.textColor = UIColor.darkGray
        text.keyboardType = .emailAddress
        text.isSecureTextEntry = secure
        text.tag = tag
        return text
    }()
    
    insetView.addSubview(emailTextField)
    return insetView
}

func updatePlace() {
    print("Updating place")
    print("CURRENT USER \(configUser)")
    let realm = try! Realm(configuration: configUser)
    let firstPlace = realm.objects(Place.self).first
    
    try! realm.write {
        firstPlace?.update = !(firstPlace?.update)!
    }
}

