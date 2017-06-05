//
//  ControlPuckCell.swift
//  mobile_ios
//
//  Created by Jacob Keith on 5/18/17.
//  Copyright © 2017 Heep. All rights reserved.
//

import UIKit

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
/*
func getModeColor(thisGroup: Group, object: Any, checklist: [String : Bool]) -> UIColor {
    
    if thisGroup.selectedControl == 0 {
        
        return UIColor.lightGray
        
    } else if thisGroup.selectedControl == 1 {
        
        
        return UIColor.green
        
    } else if thisGroup.selectedControl == 2 {
        
        
        return UIColor.red
        
        
    } else {
        return UIColor.blue
    }
    
}*/

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

