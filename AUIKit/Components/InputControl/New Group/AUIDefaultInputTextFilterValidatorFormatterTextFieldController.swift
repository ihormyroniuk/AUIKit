//
//  AUIDefaultInputTextFilterValidatorFormatterTextFieldController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 9/14/19.
//

import Foundation

/*open class AUIDefaultInputTextFilterValidatorFormatterTextFieldController: AUIDefaultTextFieldController {
  
  // MARK: AUIValidatingFormattingTextFieldController
  
  private var formattedText: String? {
    didSet {
      didSetFormattedText(oldValue: oldValue)
    }
  }
  private func didSetFormattedText(oldValue: String?) {
    if oldValue != formattedText {
      textField?.text = formattedText
      for object in didChangeTextObservers.allObjects {
        guard let observer = object as? AUITextViewControllerDidChangeTextObserver else { continue }
        observer.textViewControllerDidChangeText(self)
      }
    }
  }
  open override var text: String? {
    set {
      var filteredNewValue = newValue
      if let inputTextFilter = inputTextFilter {
        filteredNewValue = inputTextFilter.filter(text: newValue) ?? ""
      }
      guard (inputTextValidator?.isValidInputtingText(currentText: "", newText: filteredNewValue) ?? true) else { return }
      if let inputtedTextFormatter = inputTextFormatter {
        guard formattedText != filteredNewValue else { return }
        formattedText = inputtedTextFormatter.format(text: filteredNewValue)
      } else {
        formattedText = filteredNewValue
      }
    }
    get {
      if let inputtedTextFormatter = inputTextFormatter {
        return inputtedTextFormatter.unformat(formattedText: formattedText)
      } else {
        return formattedText
      }
    }
  }
  override open func didSetText(oldValue: String?) {
    
  }
  
  // MARK: AUIInputTextFilterTextFieldController
  
  open var inputTextFilter: AUITextInputFilter? {
    didSet { didSetInputTextFilter(oldValue) }
  }
  open func didSetInputTextFilter(_ oldValue: AUITextInputFilter?) {
    if let inputTextFilter = inputTextFilter {
      text = inputTextFilter.filter(text: text)
    }
  }
  
  // MARK: AUIInputTextValidatorTextFieldController
  
  open var inputTextValidator: AUITextInputValidator? {
    didSet { didSetInputtedTextValidator(oldValue) }
  }
  open func didSetInputtedTextValidator(_ oldValue: AUITextInputValidator?) {
    if !(inputTextValidator?.isValidInputtingText(currentText: text, newText: text) ?? true) {
      text = nil
    }
  }
  
  // MARK: AUIInputTextFormatterTextFieldController
  
  open var inputTextFormatter: AUITextInputFormatter? {
    didSet { didSetInputtedTextFormatter(oldValue) }
  }
  open func didSetInputtedTextFormatter(_ oldValue: AUITextInputFormatter?) {
    var oldUnformattedText = text
    if let oldValue = oldValue {
      oldUnformattedText = oldValue.unformat(formattedText: text)
    }
    text = inputTextFormatter?.format(text: oldUnformattedText)
  }
  
  // MARK: UITextFieldDelegate
  
  open override func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    var filteredString = text
    if let inputTextFilter = inputTextFilter {
      filteredString = inputTextFilter.filter(text: text) ?? ""
    }
    guard let inputtedTextFormatter = inputTextFormatter else {
      guard let textRange = Range(range, in: string) else { return true }
      let newText = (formattedText ?? "").replacingCharacters(in: textRange, with: filteredString)
      return inputTextValidator?.isValidInputtingText(currentText: formattedText, newText: newText) ?? true
    }
    let formattingResult = inputtedTextFormatter.formatInputtedText(currentText: formattedText, range: range, replacementString: filteredString)
    let currentUnformattedText = inputtedTextFormatter.unformat(formattedText: formattedText)
    let newUnformattedText = inputtedTextFormatter.unformat(formattedText: formattingResult.formattedText)
    guard (inputTextValidator?.isValidInputtingText(currentText: currentUnformattedText, newText: newUnformattedText) ?? true) else { return false }
    formattedText = formattingResult.formattedText
    if let textField = textField, let cursorLocation = textField.position(from: textField.beginningOfDocument, offset: formattingResult.caretBeginOffset) {
      DispatchQueue.main.async { textField.selectedTextRange = textField.textRange(from: cursorLocation, to: cursorLocation) }
    }
    return false
  }
  
}*/
