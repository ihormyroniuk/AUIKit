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
  
  // MARK: Observers
  
  open var didChangeTextObservers = NSHashTable<AnyObject>.weakObjects()
  
  open func addDidChangeTextObserver(_ observer: AUITextFieldControllerDidChangeTextObserver) {
    didChangeTextObservers.add(observer)
  }
  
  open func removeDidChangeTextObserver(_ observer: AUITextFieldControllerDidChangeTextObserver) {
    didChangeTextObservers.remove(observer)
  }
  
  open var didTapReturnKeyObservers = NSHashTable<AnyObject>.weakObjects()
  
  open func addDidTapReturnKeyObserver(_ observer: AUITextFieldControllerDidTapReturnKeyObserver) {
    didTapReturnKeyObservers.add(observer)
  }
  
  open func removeDidTapReturnKeyObserver(_ observer: AUITextFieldControllerDidTapReturnKeyObserver) {
    didTapReturnKeyObservers.remove(observer)
  }
  
  open var didBeginEditingObservers = NSHashTable<AnyObject>.weakObjects()
  
  open func addDidBeginEditingObserver(_ observer: AUITextFieldControllerDidBeginEditingObserver) {
    didBeginEditingObservers.add(observer)
  }
  
  open func removeDidBeginEditingObserver(_ observer: AUITextFieldControllerDidBeginEditingObserver) {
    didBeginEditingObservers.remove(observer)
  }
  
  open var didEndEditingObservers = NSHashTable<AnyObject>.weakObjects()
  
  open func addDidEndEditingObserver(_ observer: AUITextFieldControllerDidEndEditingObserver) {
    didEndEditingObservers.add(observer)
  }
  
  open func removeDidEndEditingObserver(_ observer: AUITextFieldControllerDidEndEditingObserver) {
    didEndEditingObservers.remove(observer)
  }

  open var didEndEditingReasonObservers = NSHashTable<AnyObject>.weakObjects()
  
  open func addDidEndEditingReasonObserver(_ observer: AUITextFieldControllerDidEndEditingReasonObserver) {
    didEndEditingReasonObservers.add(observer)
  }
  
  open func removeDidEndEditingReasonObserver(_ observer: AUITextFieldControllerDidEndEditingReasonObserver) {
    didEndEditingReasonObservers.remove(observer)
  }
  
  // MARK: Input Accessory View Controller
  
  open var inputAccessoryViewController: AUIViewController? {
    didSet { didSetInputAccessoryViewController(oldValue: oldValue) }
  }
  open func didSetInputAccessoryViewController(oldValue: AUIViewController?) {
    oldValue?.view = nil
    inputAccessoryViewController?.view = textField?.inputAccessoryView
  }
  
  // MARK: Input View Controller
  
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
  
  // MARK: TextField
  
  open var textField: UITextField? {
    set { view = newValue }
    get { return view as? UITextField }
  }
  
  open override func setupControl() {
    super.setupControl()
    setupTextField()
  }
  
  open func setupTextField() {
    inputAccessoryViewController?.view = textField?.inputAccessoryView
    inputViewController?.view = textField?.inputView
    textField?.placeholder = placeholder
    textField?.keyboardType = keyboardType
    textField?.isSecureTextEntry = isSecureTextEntry
    textField?.autocorrectionType = autocorrectionType
    textField?.autocapitalizationType = autocapitalizationType
    textField?.returnKeyType = returnKeyType
    textField?.text = text
    textField?.delegate = textFieldDelegate
    textField?.addObserver(keyValueObserverProxy, forKeyPath: UITextFieldTextPropertyKey, options: [.new, .old], context: nil)
  }
  
  open override func unsetupControl() {
    super.unsetupControl()
    unsetupTextField()
  }
  
  func unsetupTextField() {
    inputAccessoryViewController?.view = nil
    inputViewController?.view = nil
    textField?.delegate = nil
    textField?.removeObserver(keyValueObserverProxy, forKeyPath: UITextFieldTextPropertyKey, context: nil)
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
      for object in didChangeTextObservers.allObjects {
        guard let observer = object as? AUITextFieldControllerDidChangeTextObserver else { continue }
        observer.textFieldControllerDidChangeText(self)
      }
    }
  }
  
  open var placeholder: String? {
    didSet {
      didSetPlaceholder(oldValue: oldValue)
    }
  }
  open func didSetPlaceholder(oldValue: String?) {
    textField?.placeholder = placeholder
  }
  
  open var keyboardType: UIKeyboardType = .default {
    didSet {
      didSetKeyboardType(oldValue: oldValue)
    }
  }
  open func didSetKeyboardType(oldValue: UIKeyboardType) {
    textField?.keyboardType = keyboardType
  }
  
  open var isSecureTextEntry: Bool = false {
    didSet {
      didSetIsSecureTextEntry(oldValue: oldValue)
    }
  }
  open func didSetIsSecureTextEntry(oldValue: Bool) {
    textField?.isSecureTextEntry = isSecureTextEntry
  }
  
  open var autocorrectionType: UITextAutocorrectionType = .default {
    didSet {
      didSetAutocorrectionType(oldValue: oldValue)
    }
  }
  open func didSetAutocorrectionType(oldValue: UITextAutocorrectionType) {
    textField?.autocorrectionType = autocorrectionType
  }
  
  open var autocapitalizationType: UITextAutocapitalizationType = .none {
    didSet {
      didSetAutocapitalizationType(oldValue: oldValue)
    }
  }
  open func didSetAutocapitalizationType(oldValue: UITextAutocapitalizationType) {
    textField?.autocapitalizationType = autocapitalizationType
  }
  
  open var returnKeyType: UIReturnKeyType = .default {
    didSet {
      didSetReturnKeyType(oldValue: oldValue)
    }
  }
  open func didSetReturnKeyType(oldValue: UIReturnKeyType) {
    textField?.returnKeyType = returnKeyType
  }
  
  // MARK: UITextFieldDelegate
  
  open func textFieldShouldBeginEditing() -> Bool {
    return true
  }
  
  open func textFieldDidBeginEditing() {
    for object in didBeginEditingObservers.allObjects {
      guard let observer = object as? AUITextFieldControllerDidBeginEditingObserver else { continue }
      observer.textFieldControllerDidBeginEditing(self)
    }
  }
  
  open func textFieldShouldEndEditing() -> Bool {
    return true
  }
  
  open func textFieldDidEndEditing() {
    for object in didEndEditingObservers.allObjects {
      guard let observer = object as? AUITextFieldControllerDidEndEditingObserver else { continue }
      observer.textFieldControllerDidEndEditing(self)
    }
  }
  
  open func textFieldDidEndEditing(reason: UITextField.DidEndEditingReason) {
    for object in didEndEditingReasonObservers.allObjects {
      guard let observer = object as? AUITextFieldControllerDidEndEditingReasonObserver else { continue }
      observer.textFieldControllerDidEndEditingReason(self, reason: reason)
    }
  }
  
  open func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    return true
  }
  
  open func textFieldShouldClear() -> Bool {
    return true
  }
  
  open func textFieldShouldReturn() -> Bool {
    if !didTapReturnKeyObservers.allObjects.isEmpty {
      for object in didTapReturnKeyObservers.allObjects {
        guard let observer = object as? AUITextFieldControllerDidTapReturnKeyObserver else { continue }
        observer.textFieldControllerDidTapReturnKey(self)
      }
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
