//
//  UIFont+CGFont.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 10/21/19.
//

import UIKit

public extension UIFont {
    
    var cgFont: CGFont? {
        return CGFont(fontName as NSString)
    }
    
}
