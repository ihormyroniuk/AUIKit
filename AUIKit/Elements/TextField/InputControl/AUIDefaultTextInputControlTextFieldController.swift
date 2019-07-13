//
//  AUIDefaultTextInputControlTextFieldController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/7/19.
//

import Foundation

open class AUIDefaultTextInputControlTextFieldController: AUIDefaultTextFieldController, AUITextInputControlTextFieldController {
  
  // MARK: AUITextInputControlTextFieldController
  
  open var textInputControl: AUITextInputControl? {
    didSet {
      didSetTextInputControl(oldValue)
    }
  }
  open func didSetTextInputControl(_ oldValue: AUITextInputControl?) {
    let oldText = textInputControl?.clearText(displayedText)
    text = oldText
  }
  
  // MARK: States
  
  private var displayedText: String? {
    didSet {
      didSetDisplayedText(oldValue: oldValue)
    }
  }
  private func didSetDisplayedText(oldValue: String?) {
    if oldValue != displayedText {
      textField?.text = displayedText
      for object in didChangeTextObservers.allObjects {
        guard let observer = object as? AUITextFieldControllerDidChangeTextObserver else { continue }
        observer.textFieldControllerDidChangeText(self)
      }
    }
  }
  open override var text: String? {
    set {
      if let textInputControl = textInputControl {
        guard displayedText != newValue else { return }
        displayedText = textInputControl.processTextInput(currentDisplayedText: displayedText, range: NSRange(location: 0, length: (displayedText ?? "").count), replacementText: newValue).displayedText
      } else {
        displayedText = newValue
      }
    }
    get {
      if let textInputControl = textInputControl {
        return textInputControl.clearText(displayedText)
      } else {
        return displayedText
      }
    }
  }
  override open func didSetText(oldValue: String?) {
    
  }
  
  // MARK: UITextFieldDelegate
  
  open override func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard let result = textInputControl?.processTextInput(currentDisplayedText: displayedText, range: range, replacementText: string) else {
      return true
    }
    displayedText = result.displayedText
    if let textField = textField, let cursorLocation = textField.position(from: textField.beginningOfDocument, offset: result.caretPosition) {
      DispatchQueue.main.async { textField.selectedTextRange = textField.textRange(from: cursorLocation, to: cursorLocation) }
    }
    return false
  }
  
}
