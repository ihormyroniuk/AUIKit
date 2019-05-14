//
//  AUIDefaultValidatingTextFieldController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/14/19.
//

import Foundation

open class AUIDefaultValidatingTextFieldController: AUIDefaultTextFieldController, AUIValidatingTextFieldController {
  
  // MARK: AUIValidatingFormattingTextFieldController
  
  open var inputtedTextValidator: AUIInputtedTextValidator? {
    didSet { didSetInputtedTextValidator(oldValue) }
  }
  open func didSetInputtedTextValidator(_ oldValue: AUIInputtedTextValidator?) {
    if !(inputtedTextValidator?.isValidInputtedText(currentText: text, newText: text) ?? true) {
      text = nil
    }
  }
  
  open override func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard let textRange = Range(range, in: text ?? "") else { return true }
    let newText = (text ?? "").replacingCharacters(in: textRange, with: string)
    return inputtedTextValidator?.isValidInputtedText(currentText: text, newText: newText) ?? true
  }
  
}
