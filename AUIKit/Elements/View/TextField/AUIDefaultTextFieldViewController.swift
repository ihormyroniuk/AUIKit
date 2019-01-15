//
//  AUIDefaultTextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/9/19.
//

import Foundation

class AUIDefaultTextFieldViewController: AUIDefaultViewController, AUITextFieldControllerDidChangeTextDelegate, AUITextFieldControllerDidBeginEditingDelegate, AUITextFieldControllerDidEndEditingDelegate {
  
  var textField: UITextField? {
    set {  }
    get { return nil }
  }
  
  var text: String? {
    get {
      return textFieldController.text
    }
    set {
      textFieldController.text = newValue
    }
  }
  
  var placeholder: String? {
    get {
      return textFieldController.placeholder
    }
    set {
      textFieldController.placeholder = newValue
    }
  }
  
  var keyboardType: UIKeyboardType {
    get {
      return textFieldController.keyboardType
    }
    set {
      textFieldController.keyboardType = newValue
    }
  }
  
  var isSecureTextEntry: Bool {
    get {
      return textFieldController.isSecureTextEntry
    }
    set {
      textFieldController.isSecureTextEntry = newValue
    }
  }
  
  var autocorrectionType: UITextAutocorrectionType {
    get {
      return textFieldController.autocorrectionType
    }
    set {
      textFieldController.autocorrectionType = newValue
    }
  }
  
  var autocapitalizationType: UITextAutocapitalizationType {
    get {
      return textFieldController.autocapitalizationType
    }
    set {
      textFieldController.autocapitalizationType = newValue
    }
  }
  
  var returnKeyType: UIReturnKeyType {
    get {
      return textFieldController.returnKeyType
    }
    set {
      textFieldController.returnKeyType = newValue
    }
  }
  
  var control: UIControl? {
    set {  }
    get { return nil }
  }
  
  var isEnabled: Bool {
    get { return textFieldController.isEnabled }
    set { textFieldController.isEnabled = newValue }
  }
  
  // MARK: Delegates
  
  weak var didChangeTextDelegate: AUITextFieldControllerDidChangeTextDelegate?
  weak var didTapReturnKeyDelegate: AUITextFieldControllerDidTapReturnKeyDelegate?
  weak var didBeginEditingDelegate: AUITextFieldControllerDidBeginEditingDelegate?
  weak var didEndEditingDelegate: AUITextFieldControllerDidEndEditingDelegate?
  weak var didEndEditingReasonDelegate: AUITextFieldControllerDidEndEditingReasonDelegate?
  weak var touchUpInsideEventDelegate: AUIControlControllerTouchUpInsideDelegate?
  weak var editingChangedEventDelegate: AUIControlControllerEditingChangedDelegate?
  weak var valueChangedEventDelegate: AUIControlControllerValueChangedDelegate?
  
  // MARK: Elements
  
  let textFieldController: AUITextFieldController = AUIDefaultTextFieldController()
  
  // MARK: Setup
  
  override func setup() {
    super.setup()
    textFieldController.didChangeTextDelegate = self
    textFieldController.didBeginEditingDelegate = self
    textFieldController.didEndEditingDelegate = self
  }
  
  // MARK: View
  
  open var textFieldView: (UIView & AUITextFieldView)? {
    set { view = newValue }
    get { return view as? (UIView & AUITextFieldView) }
  }
  
  open override func setupView() {
    super.setupView()
    textFieldController.textField = textFieldView?.textField
  }
  
  open override func unsetupView() {
    super.unsetupView()
    textFieldController.textField = nil
  }
  
  // MARK: Events
  
  func textFieldControllerDidChangeText(_ textFieldController: AUITextFieldController) {
    didChangeTextDelegate?.textFieldControllerDidChangeText(textFieldController)
  }
  
  func textFieldControllerDidBeginEditing(_ textFieldController: AUITextFieldController) {
    didBeginEditingDelegate?.textFieldControllerDidBeginEditing(textFieldController)
    if text?.isEmpty == false {
      textFieldView?.editingNotEmpty()
    } else {
      textFieldView?.editingEmpty()
    }
  }
  
  func textFieldControllerDidEndEditing(_ textFieldController: AUITextFieldController) {
    didEndEditingDelegate?.textFieldControllerDidEndEditing(textFieldController)
    if text?.isEmpty == false {
      textFieldView?.notEditingNotEmpty()
    } else {
      textFieldView?.notEditingEmpty()
    }
  }
  
}
