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
      let attributedString = NSAttributedString(string: newValue, attributes: attributes)
      attributedText = attributedString
    }
  }
  
  // MARK: Attributes
  
  open var kern: Float?

}
