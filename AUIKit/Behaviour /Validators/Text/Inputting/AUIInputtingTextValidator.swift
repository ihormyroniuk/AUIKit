//
//  InputtedTextValidator.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/14/19.
//

import Foundation

public protocol AUIInputtingTextValidator {
  func isValidInputtingText(currentText: String?, newText: String?) -> Bool
}
