//
//  AUIDefaultTextInputControlTextViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 8/2/19.
//

import Foundation

open class AUIDefaultTextInputControlTextViewController: AUIDefaultTextViewController, AUITextInputControlTextViewController {
  
  // MARK: AUITextInputControlTextViewController
  
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
      textView?.text = displayedText
      for object in didChangeTextObservers.allObjects {
        guard let observer = object as? AUITextViewControllerDidChangeTextObserver else { continue }
        observer.textViewControllerDidChangeText(self)
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
  
  // MARK: UITextViewDelegate
  
  open override func textView(shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    guard let result = textInputControl?.processTextInput(currentDisplayedText: displayedText, range: range, replacementText: text) else {
      return true
    }
    displayedText = result.displayedText
    if let textView = textView, let cursorLocation = textView.position(from: textView.beginningOfDocument, offset: result.caretPosition) {
      DispatchQueue.main.async { textView.selectedTextRange = textView.textRange(from: cursorLocation, to: cursorLocation) }
    }
    return false
  }
  
}
