//
//  TextFieldController.swift
//  Scenery
//
//  Created by Ihor Myroniuk on 8/2/18.
//  Copyright © 2018 Ihor Myroniuk. All rights reserved.
//

import UIKit

private let UITextFieldTextPropertyKey = "text"

open class AUIDefaultTextFieldController: AUIDefaultControlController, AUITextFieldController, UITextFieldDelegateProxyDelegate,
KeyValueObserverProxyDelegate {

  // MARK: Delegates
  
  private let keyValueObserverProxy = KeyValueObserverProxy()
  private let textFieldDelegate = UITextFieldDelegateProxy()
  open weak var didChangeTextDelegate: AUITextFieldControllerDidChangeTextDelegate?
  open weak var didTapReturnKeyDelegate: AUITextFieldControllerDidTapReturnKeyDelegate?
  open weak var didBeginEditingDelegate: AUITextFieldControllerDidBeginEditingDelegate?
  open weak var didEndEditingDelegate: AUITextFieldControllerDidEndEditingDelegate?
  open weak var didEndEditingReasonDelegate: AUITextFieldControllerDidEndEditingReasonDelegate?
  
  // MARK: Controllers
  
  open var inputAccessoryViewController: AUIViewController? {
    didSet { didSetInputAccessoryViewController(oldValue: oldValue) }
  }
  open func didSetInputAccessoryViewController(oldValue: AUIViewController?) {
    oldValue?.view = nil
    inputAccessoryViewController?.view = textField?.inputAccessoryView
  }
  
  open var inputViewController: AUIViewController? {
    didSet { didSetInputViewController(oldValue: oldValue) }
  }
  open func didSetInputViewController(oldValue: AUIViewController?) {
    oldValue?.view = nil
    inputViewController?.view = textField?.inputView
  }
  
  // MARK: Setup
  
  open override func setup() {
    super.setup()
    keyValueObserverProxy.delegate = self
    textFieldDelegate.delegate = self
  }
  
  // MARK: View
  
  open var textField: UITextField? {
    set { view = newValue }
    get { return view as? UITextField }
  }
  
  open override func setupView() {
    super.setupView()
    textField?.placeholder = placeholder
    textField?.keyboardType = keyboardType
    textField?.delegate = textFieldDelegate
    textField?.isSecureTextEntry = isSecureTextEntry
    textField?.autocorrectionType = autocorrectionType
    textField?.autocapitalizationType = autocapitalizationType
    textField?.returnKeyType = returnKeyType
    textField?.text = text
    inputAccessoryViewController?.view = textField?.inputAccessoryView
    inputViewController?.view = textField?.inputView
    textField?.addObserver(keyValueObserverProxy, forKeyPath: UITextFieldTextPropertyKey, options: [.new, .old], context: nil)
  }
  
  open override func unsetupView() {
    super.unsetupView()
    textField?.removeObserver(keyValueObserverProxy, forKeyPath: UITextFieldTextPropertyKey, context: nil)
    textField?.delegate = nil
    inputAccessoryViewController?.view = nil
    inputViewController?.view = nil
  }
  
  // MARK: States

  open var text: String? {
    didSet {
      didSetText(oldValue: oldValue)
    }
  }
  open func didSetText(oldValue: String?) {
    if oldValue != text {
      textField?.text = text
      didChangeTextDelegate?.textFieldControllerDidChangeText(self)
    }
  }
  
  open var placeholder: String? {
    didSet { didSetPlaceholder(oldValue: oldValue) }
  }
  open func didSetPlaceholder(oldValue: String?) {
    textField?.placeholder = placeholder
  }
  
  open var keyboardType: UIKeyboardType = .default {
    didSet { didSetKeyboardType(oldValue: oldValue) }
  }
  open func didSetKeyboardType(oldValue: UIKeyboardType) {
    textField?.keyboardType = keyboardType
  }
  
  open var isSecureTextEntry: Bool = false {
    didSet { didSetIsSecureTextEntry(oldValue: oldValue) }
  }
  open func didSetIsSecureTextEntry(oldValue: Bool) {
    textField?.isSecureTextEntry = isSecureTextEntry
  }
  
  open var autocorrectionType: UITextAutocorrectionType = .default {
    didSet { didSetAutocorrectionType(oldValue: oldValue) }
  }
  open func didSetAutocorrectionType(oldValue: UITextAutocorrectionType) {
    textField?.autocorrectionType = autocorrectionType
  }
  
  open var autocapitalizationType: UITextAutocapitalizationType = .none {
    didSet { didSetAutocapitalizationType(oldValue: oldValue) }
  }
  open func didSetAutocapitalizationType(oldValue: UITextAutocapitalizationType) {
    textField?.autocapitalizationType = autocapitalizationType
  }
  
  open var returnKeyType: UIReturnKeyType = .default {
    didSet { didSetReturnKeyType(oldValue: oldValue) }
  }
  open func didSetReturnKeyType(oldValue: UIReturnKeyType) {
    textField?.returnKeyType = returnKeyType
  }
  
  // MARK: UITextFieldDelegate
  
  open func textFieldShouldBeginEditing() -> Bool {
    return true
  }
  
  open func textFieldDidBeginEditing() {
    didBeginEditingDelegate?.textFieldControllerDidBeginEditing(self)
  }
  
  open func textFieldShouldEndEditing() -> Bool {
    return true
  }
  
  open func textFieldDidEndEditing() {
    didEndEditingDelegate?.textFieldControllerDidEndEditing(self)
  }
  
  open func textFieldDidEndEditing(reason: UITextField.DidEndEditingReason) {
    didEndEditingReasonDelegate?.textFieldControllerDidEndEditingReason(self, reason: reason)
  }
  
  open func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    return true
  }
  
  open func textFieldShouldClear() -> Bool {
    return true
  }
  
  open func textFieldShouldReturn() -> Bool {
    if didTapReturnKeyDelegate != nil {
      didTapReturnKeyDelegate?.textFieldControllerDidTapReturnKey(self)
      return false
    }
    return true
  }
  
  // MARK: KeyValueObserverProxyDelegate
  
  open func textFieldDidChangeText(_ textField: UITextField) {
    text = textField.text
  }
  
  // MARK: Actions
  
  open override func editingChangedEventAction() {
    text = textField?.text
  }
  
  // MARK:
  
  open func clean() {
    textField?.text = nil
  }
}

private protocol UITextFieldDelegateProxyDelegate: class {
  func textFieldShouldBeginEditing() -> Bool
  func textFieldDidBeginEditing()
  func textFieldShouldEndEditing() -> Bool
  func textFieldDidEndEditing()
  func textFieldDidEndEditing(reason: UITextField.DidEndEditingReason)
  func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
  func textFieldShouldClear() -> Bool
  func textFieldShouldReturn() -> Bool
}

private class UITextFieldDelegateProxy: NSObject, UITextFieldDelegate {
  weak var delegate: UITextFieldDelegateProxyDelegate?
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    return delegate?.textFieldShouldBeginEditing() ?? false
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    delegate?.textFieldDidBeginEditing()
  }
  
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    return delegate?.textFieldShouldEndEditing() ?? true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    delegate?.textFieldDidEndEditing()
  }
  
  func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
    delegate?.textFieldDidEndEditing(reason: reason)
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    return delegate?.textField(shouldChangeCharactersIn: range, replacementString: string) ?? false
  }
  
  func textFieldShouldClear(_ textField: UITextField) -> Bool {
    return delegate?.textFieldShouldClear() ?? true
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    return delegate?.textFieldShouldReturn() ?? true
  }
}

private protocol KeyValueObserverProxyDelegate: class {
  func textFieldDidChangeText(_ textField: UITextField)
}

private class KeyValueObserverProxy: NSObject {
  
  weak var delegate: KeyValueObserverProxyDelegate?
  
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath == UITextFieldTextPropertyKey, let textField = object as? UITextField { delegate?.textFieldDidChangeText(textField) }
  }
  
}
