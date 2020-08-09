//
//  AUIAttributedLabel.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/19/19.
//

import UIKit

open class AUIAttributedLabel: AUILabel {
  
    // MARK: Text
  
    open override var text: String? {
        get {
            return attributedText?.string
        }
        set {
            guard let newValue = newValue else {
                attributedText = nil
                return
            }
            var attributes: [NSAttributedString.Key: Any]? = [:]
            attributes?[.font] = font
            attributes?[.foregroundColor] = textColor
            if let kern = kern {
                attributes?[.kern] = NSNumber(value: kern)
            }
            if let textBackgroundColor = textBackgroundColor {
                attributes?[.backgroundColor] = textBackgroundColor
            }
            if let underlineStyle = underlineStyle {
                attributes?[.underlineStyle] = NSNumber(value: underlineStyle.rawValue)
            }
            let attributedString = NSAttributedString(string: newValue, attributes: attributes)
            attributedText = attributedString
        }
    }
    
    open func resetText() {
        if let text = text {
            self.text = text
        }
    }
  
    // MARK: Attributes
    
    open override var font: UIFont! {
        didSet {
            didSetFont(oldValue: oldValue)
        }
    }
    open func didSetFont(oldValue: UIFont!) {
        resetText()
    }
    
    open override var textColor: UIColor! {
        didSet {
            didSetTextColor(oldValue: oldValue)
        }
    }
    open func didSetTextColor(oldValue: UIColor!) {
        resetText()
    }
  
    open var kern: Float? {
        didSet {
            didSetKern(oldValue: oldValue)
        }
    }
    open func didSetKern(oldValue: Float?) {
        resetText()
    }
    
    open var textBackgroundColor: UIColor? {
        didSet {
            didSetTextBackgroundColor(oldValue: oldValue)
        }
    }
    open func didSetTextBackgroundColor(oldValue: UIColor?) {
        resetText()
    }
    
    open var underlineStyle: NSUnderlineStyle? {
        didSet {
            didSetUnderlineStyle(oldValue: oldValue)
        }
    }
    open func didSetUnderlineStyle(oldValue: NSUnderlineStyle?) {
        resetText()
    }
    
}
