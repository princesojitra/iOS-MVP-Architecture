//
//  UIColour+HexColour.swift
//  RosterAssignment
//
//  Created by Prince Sojitra on 18/09/19.
//  Copyright © 2019 Prince Sojitra. All rights reserved.
//


import Foundation
import UIKit

extension UIColor {
    
    func HexStringToUIColor (hex:String) -> UIColor {
        var strHex:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (strHex.hasPrefix("#")) {
            strHex.remove(at: strHex.startIndex)
        }
        
        if ((strHex.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: strHex).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
