//
//  UIFont+CGFont.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 12/11/19.
//

import UIKit

public extension UIFont {

    var cgFont: CGFont? {
        return CGFont(fontName as NSString)
    }

}
