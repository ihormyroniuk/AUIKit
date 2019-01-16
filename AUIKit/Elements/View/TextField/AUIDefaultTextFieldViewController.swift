//
//  AUIDefaultTextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/9/19.
//

import Foundation

open class AUIDefaultTextFieldViewController: AUIDefaultViewController, AUITextFieldControllerDidChangeTextDelegate, AUITextFieldControllerDidBeginEditingDelegate, AUITextFieldControllerDidEndEditingDelegate, AUITextFieldControllerDidEndEditingReasonDelegate {
  
  open var textField: UITextField? {
    set {  }
    get { return nil }
  }
  
  open var text: String? {
    get {
      return textFieldController.text
    }
    set {
      textFieldController.text = newValue
    }
  }
  
  open var placeholder: String? {
    get {
      return textFieldController.placeholder
    }
    set {
      textFieldController.placeholder = newValue
    }
  }
  
  open var keyboardType: UIKeyboardType {
    get {
      return textFieldController.keyboardType
    }
    set {
      textFieldController.keyboardType = newValue
    }
  }
  
  open var isSecureTextEntry: Bool {
    get {
      return textFieldController.isSecureTextEntry
    }
    set {
      textFieldController.isSecureTextEntry = newValue
    }
  }
  
  open var autocorrectionType: UITextAutocorrectionType {
    get {
      return textFieldController.autocorrectionType
    }
    set {
      textFieldController.autocorrectionType = newValue
    }
  }
  
  open var autocapitalizationType: UITextAutocapitalizationType {
    get {
      return textFieldController.autocapitalizationType
    }
    set {
      textFieldController.autocapitalizationType = newValue
    }
  }
  
  open var returnKeyType: UIReturnKeyType {
    get {
      return textFieldController.returnKeyType
    }
    set {
      textFieldController.returnKeyType = newValue
    }
  }
  
  open var control: UIControl? {
    set {  }
    get { return nil }
  }
  
  open var isEnabled: Bool {
    get { return textFieldController.isEnabled }
    set { textFieldController.isEnabled = newValue }
  }
  
  // MARK: Delegates
  
  open weak var didChangeTextDelegate: AUITextFieldControllerDidChangeTextDelegate?
  open weak var didTapReturnKeyDelegate: AUITextFieldControllerDidTapReturnKeyDelegate?
  open weak var didBeginEditingDelegate: AUITextFieldControllerDidBeginEditingDelegate?
  open weak var didEndEditingDelegate: AUITextFieldControllerDidEndEditingDelegate?
  open weak var didEndEditingReasonDelegate: AUITextFieldControllerDidEndEditingReasonDelegate?
  open weak var touchUpInsideEventDelegate: AUIControlControllerTouchUpInsideDelegate?
  open weak var editingChangedEventDelegate: AUIControlControllerEditingChangedDelegate?
  open weak var valueChangedEventDelegate: AUIControlControllerValueChangedDelegate?
  
  // MARK: Elements
  
  public let textFieldController: AUITextFieldController = AUIDefaultTextFieldController()
  
  // MARK: Setup
  
  open override func setup() {
    super.setup()
    textFieldController.didChangeTextDelegate = self
    textFieldController.didBeginEditingDelegate = self
    textFieldController.didEndEditingDelegate = self
    textFieldController.didEndEditingReasonDelegate = self
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
  
  open func textFieldControllerDidChangeText(_ textFieldController: AUITextFieldController) {
    didChangeTextDelegate?.textFieldControllerDidChangeText(textFieldController)
  }
  
  open func textFieldControllerDidBeginEditing(_ textFieldController: AUITextFieldController) {
    didBeginEditingDelegate?.textFieldControllerDidBeginEditing(textFieldController)
    if text?.isEmpty == false {
      textFieldView?.editingNotEmpty()
    } else {
      textFieldView?.editingEmpty()
    }
  }
  
  open func textFieldControllerDidEndEditing(_ textFieldController: AUITextFieldController) {
    didEndEditingDelegate?.textFieldControllerDidEndEditing(textFieldController)
    if text?.isEmpty == false {
      textFieldView?.notEditingNotEmpty()
    } else {
      textFieldView?.notEditingEmpty()
    }
  }
  
  public func textFieldControllerDidEndEditingReason(_ controller: AUITextFieldController, reason: UITextField.DidEndEditingReason) {
    didEndEditingReasonDelegate?.textFieldControllerDidEndEditingReason(controller, reason: reason)
    if text?.isEmpty == false {
      textFieldView?.notEditingNotEmpty()
    } else {
      textFieldView?.notEditingEmpty()
    }
  }
  
}
