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
  
  private var formattedText: String? {
    didSet {
      didSetFormattedText(oldValue: oldValue)
    }
  }
  private func didSetFormattedText(oldValue: String?) {
    if oldValue != formattedText {
      textField?.text = formattedText
      for object in didChangeTextObservers.allObjects {
        guard let observer = object as? AUITextFieldControllerDidChangeTextObserver else { continue }
        observer.textFieldControllerDidChangeText(self)
      }
    }
  }
  open override var text: String? {
    set {
      guard (inputtedTextValidator?.isValidInputtingText(currentText: "", newText: newValue) ?? true) else { return }
      if let inputtedTextFormatter = inputtedTextFormatter {
        guard formattedText != newValue else { return }
        formattedText = inputtedTextFormatter.format(text: newValue)
      } else {
        formattedText = newValue
      }
    }
    get {
      if let inputtedTextFormatter = inputtedTextFormatter {
        return inputtedTextFormatter.unformat(formattedText: formattedText)
      } else {
        return formattedText
      }
    }
  }
  override open func didSetText(oldValue: String?) {
    
  }
  
  open var inputtedTextFormatter: AUIInputtedTextFormatter? {
    didSet { didSetInputtedTextFormatter(oldValue) }
  }
  open func didSetInputtedTextFormatter(_ oldValue: AUIInputtedTextFormatter?) {
    let oldUnformattedText = oldValue?.unformat(formattedText: text)
    text = inputtedTextFormatter?.format(text: oldUnformattedText)
  }
  
  open var inputtedTextValidator: AUIInputtingTextValidator? {
    didSet { didSetInputtedTextValidator(oldValue) }
  }
  open func didSetInputtedTextValidator(_ oldValue: AUIInputtingTextValidator?) {
    if !(inputtedTextValidator?.isValidInputtingText(currentText: text, newText: text) ?? true) {
      text = nil
    }
  }
  
  open override func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard let inputtedTextFormatter = inputtedTextFormatter else {
      guard let textRange = Range(range, in: text ?? "") else { return true }
      let newText = (formattedText ?? "").replacingCharacters(in: textRange, with: string)
      return inputtedTextValidator?.isValidInputtingText(currentText: formattedText, newText: newText) ?? true
    }
    let formattingResult = inputtedTextFormatter.formatInputtedText(currentText: formattedText, range: range, replacementString: string)
    let currentUnformattedText = inputtedTextFormatter.unformat(formattedText: formattedText)
    let newUnformattedText = inputtedTextFormatter.unformat(formattedText: formattingResult.formattedText)
    guard (inputtedTextValidator?.isValidInputtingText(currentText: currentUnformattedText, newText: newUnformattedText) ?? true) else { return false }
    formattedText = formattingResult.formattedText
    if let textField = textField, let cursorLocation = textField.position(from: textField.beginningOfDocument, offset: formattingResult.caretBeginOffset) {
      DispatchQueue.main.async { textField.selectedTextRange = textField.textRange(from: cursorLocation, to: cursorLocation) }
    }
    return false
  }
  
}
