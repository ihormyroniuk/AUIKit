//
//  UIColor+Extension.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/6/19.
//

import UIKit

public extension UIColor {
  
    // MARK: Initializer
  
    convenience init(red8Bits: UInt8, green8Bits: UInt8, blue8Bits: UInt8, alpha8Bits: UInt8) {
        self.init(red: CGFloat(red8Bits) / CGFloat(UInt8.max), green: CGFloat(green8Bits) / CGFloat(UInt8.max), blue: CGFloat(blue8Bits) / CGFloat(UInt8.max), alpha: CGFloat(alpha8Bits) / CGFloat(UInt8.max))
    }
  
    convenience init(red8Bits: UInt8, green8Bits: UInt8, blue8Bits: UInt8, alpha: CGFloat) {
        self.init(red: CGFloat(red8Bits) / CGFloat(UInt8.max), green: CGFloat(green8Bits) / CGFloat(UInt8.max), blue: CGFloat(blue8Bits) / CGFloat(UInt8.max), alpha: alpha)
    }
  
    // MARK: Components
  
    var componentsRGBA: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let color = CIColor(color: self)
        return (color.red, color.green, color.blue, color.alpha)
    }
  
}
