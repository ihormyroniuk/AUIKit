//
//  AUIDefaultValidatingFormattingTextFieldController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/14/19.
//

import Foundation

open class AUIDefaultValidatingFormattingTextFieldController: AUIDefaultTextFieldController, AUIValidatingFormattingTextFieldController {
  
  // MARK: AUIValidatingFormattingTextFieldController
  
  open var unformattedText: String? {
    get {
      if let inputtedTextFormatter = inputtedTextFormatter {
        return inputtedTextFormatter.unformat(formattedText: text)
      }
      return text
    }
  }
  
  open var inputtedTextFormatter: AUIInputtedTextFormatter? {
    didSet { didSetInputtedTextFormatter(oldValue) }
  }
  open func didSetInputtedTextFormatter(_ oldValue: AUIInputtedTextFormatter?) {
    let oldUnformattedText = oldValue?.unformat(formattedText: text)
    text = inputtedTextFormatter?.format(text: oldUnformattedText)
  }
  
  open var inputtedTextValidator: AUIInputtedTextValidator? {
    didSet { didSetInputtedTextValidator(oldValue) }
  }
  open func didSetInputtedTextValidator(_ oldValue: AUIInputtedTextValidator?) {
    if !(inputtedTextValidator?.isValidInputtedText(currentText: text, newText: text) ?? true) {
      text = nil
    }
  }
  
  open override func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard let inputtedTextFormatter = inputtedTextFormatter else {
      guard let textRange = Range(range, in: text ?? "") else { return true }
      let newText = (text ?? "").replacingCharacters(in: textRange, with: string)
      return inputtedTextValidator?.isValidInputtedText(currentText: text, newText: newText) ?? true
    }
    let formattingResult = inputtedTextFormatter.formatInputtedText(currentText: text, range: range, replacementString: string)
    let currentUnformattedText = inputtedTextFormatter.unformat(formattedText: text)
    let newUnformattedText = inputtedTextFormatter.unformat(formattedText: currentUnformattedText)
    guard (inputtedTextValidator?.isValidInputtedText(currentText: currentUnformattedText, newText: newUnformattedText) ?? true) else { return false }
    text = formattingResult.formattedText
    if let textField = textField, let cursorLocation = textField.position(from: textField.beginningOfDocument, offset: formattingResult.caretBeginOffset) {
      DispatchQueue.main.async { textField.selectedTextRange = textField.textRange(from: cursorLocation, to: cursorLocation) }
    }
    return false
  }
  
}
