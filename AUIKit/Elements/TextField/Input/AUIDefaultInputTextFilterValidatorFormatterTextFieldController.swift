//
//  AUIDefaultValidatingFormattingTextFieldController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/14/19.
//

import Foundation

open class AUIDefaultInputTextFilterValidatorFormatterTextFieldController: AUIDefaultTextFieldController, AUIInputTextFilterTextFieldController, AUIInputTextValidatorTextFieldController, AUIInputTextFormatterTextFieldController {
  
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
        guard let observer = object as? AUITextFieldControllerDidChangeTextObserver else { continue }
        observer.textFieldControllerDidChangeText(self)
      }
    }
  }
  open override var text: String? {
    set {
      var filteredNewValue = newValue
      if let inputTextFilter = inputTextFilter {
        filteredNewValue = inputTextFilter.filterInputText(newValue) ?? ""
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
  
  open var inputTextFilter: AUIInputTextFilter? {
    didSet { didSetInputTextFilter(oldValue) }
  }
  open func didSetInputTextFilter(_ oldValue: AUIInputTextFilter?) {
    if let inputTextFilter = inputTextFilter {
      text = inputTextFilter.filterInputText(text)
    }
  }
  
  // MARK: AUIInputTextValidatorTextFieldController
  
  open var inputTextValidator: AUIInputTextValidator? {
    didSet { didSetInputtedTextValidator(oldValue) }
  }
  open func didSetInputtedTextValidator(_ oldValue: AUIInputTextValidator?) {
    if !(inputTextValidator?.isValidInputtingText(currentText: text, newText: text) ?? true) {
      text = nil
    }
  }
  
  // MARK: AUIInputTextFormatterTextFieldController
  
  open var inputTextFormatter: AUIInputTextFormatter? {
    didSet { didSetInputtedTextFormatter(oldValue) }
  }
  open func didSetInputtedTextFormatter(_ oldValue: AUIInputTextFormatter?) {
    let oldUnformattedText = oldValue?.unformat(formattedText: text)
    text = inputTextFormatter?.format(text: oldUnformattedText)
  }
  
  // MARK: UITextFieldDelegate
  
  open override func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    var filteredString = string
    if let inputTextFilter = inputTextFilter {
      filteredString = inputTextFilter.filterInputText(string) ?? ""
    }
    guard let inputtedTextFormatter = inputTextFormatter else {
      guard let textRange = Range(range, in: text ?? "") else { return true }
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
  
}
