//
//  AUIDefaultTextViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 2/15/19.
//

import Foundation

private let UITextViewTextPropertyKey = "text"

open class AUIDefaultTextViewController: AUIDefaultScrollViewController, AUITextViewController, UITextFieldDelegateProxyDelegate {

  // MARK: Delegates
  
  private let textFieldDelegate = UITextViewDelegateProxy()
  
  open var didChangeTextObservers = NSHashTable<AnyObject>.weakObjects()
  
  open func addDidChangeTextObserver(_ observer: AUITextViewControllerDidChangeTextObserver) {
    didChangeTextObservers.add(observer)
  }
  
  open func removeDidChangeTextObserver(_ observer: AUITextViewControllerDidChangeTextObserver) {
    didChangeTextObservers.remove(observer)
  }
  
  open var didBeginEditingObservers = NSHashTable<AnyObject>.weakObjects()
  
  open func addDidBeginEditingObserver(_ observer: AUITextViewControllerDidBeginEditingObserver) {
    didBeginEditingObservers.add(observer)
  }
  
  open func removeDidBeginEditingObserver(_ observer: AUITextViewControllerDidBeginEditingObserver) {
    didBeginEditingObservers.remove(observer)
  }
  
  open var didEndEditingObservers = NSHashTable<AnyObject>.weakObjects()
  
  open func addDidEndEditingObserver(_ observer: AUITextViewControllerDidEndEditingObserver) {
    didEndEditingObservers.add(observer)
  }
  
  open func removeDidEndEditingObserver(_ observer: AUITextViewControllerDidEndEditingObserver) {
    didEndEditingObservers.remove(observer)
  }
  
  // MARK: Input Accessory View Controller
  
  open var inputAccessoryViewController: AUIViewController? {
    didSet { didSetInputAccessoryViewController(oldValue: oldValue) }
  }
  open func didSetInputAccessoryViewController(oldValue: AUIViewController?) {
    oldValue?.view = nil
    inputAccessoryViewController?.view = textView?.inputAccessoryView
  }
  
  // MARK: Input View Controller
  
  open var inputViewController: AUIViewController? {
    didSet { didSetInputViewController(oldValue: oldValue) }
  }
  open func didSetInputViewController(oldValue: AUIViewController?) {
    oldValue?.view = nil
    inputViewController?.view = textView?.inputView
  }
  
  // MARK: Setup
  
  open override func setup() {
    super.setup()
    textFieldDelegate.delegate = self
  }
  
  // MARK: TextView
  
  open var textView: UITextView? {
    set { view = newValue }
    get { return view as? UITextView }
  }
  
  open override func setupScrollView() {
    super.setupScrollView()
    setupTextView()
  }
  
  open func setupTextView() {
    textView?.delegate = textFieldDelegate
    inputAccessoryViewController?.view = textView?.inputAccessoryView
    inputViewController?.view = textView?.inputView
    textView?.keyboardType = keyboardType
    textView?.returnKeyType = returnKeyType
    textView?.autocorrectionType = autocorrectionType
    textView?.autocapitalizationType = autocapitalizationType
    textView?.isSecureTextEntry = isSecureTextEntry
  }
  
  open override func unsetupScrollView() {
    super.unsetupScrollView()
    unsetupTextField()
  }
  
  func unsetupTextField() {
    textView?.delegate = nil
    inputAccessoryViewController?.view = nil
    inputViewController?.view = nil
  }

  // MARK: States
  
  open var text: String! {
    didSet {
      didSetText(oldValue: oldValue)
    }
  }
  open func didSetText(oldValue: String!) {
    if oldValue != text {
      textView?.text = text
      for object in didChangeTextObservers.allObjects {
        guard let observer = object as? AUITextViewControllerDidChangeTextObserver else { continue }
        observer.textViewControllerDidChangeText(self)
      }
    }
  }
  
  open var keyboardType: UIKeyboardType = .default {
    didSet { didSetKeyboardType(oldValue: oldValue) }
  }
  open func didSetKeyboardType(oldValue: UIKeyboardType) {
    textView?.keyboardType = keyboardType
  }
  
  open var returnKeyType: UIReturnKeyType = .default {
    didSet { didSetReturnKeyType(oldValue: oldValue) }
  }
  open func didSetReturnKeyType(oldValue: UIReturnKeyType) {
    textView?.returnKeyType = returnKeyType
  }
  
  open var autocorrectionType: UITextAutocorrectionType = .default {
    didSet { didSetAutocorrectionType(oldValue: oldValue) }
  }
  open func didSetAutocorrectionType(oldValue: UITextAutocorrectionType) {
    textView?.autocorrectionType = autocorrectionType
  }
  
  open var autocapitalizationType: UITextAutocapitalizationType = .none {
    didSet { didSetAutocapitalizationType(oldValue: oldValue) }
  }
  open func didSetAutocapitalizationType(oldValue: UITextAutocapitalizationType) {
    textView?.autocapitalizationType = autocapitalizationType
  }
  
  open var isSecureTextEntry: Bool = false {
    didSet { didSetIsSecureTextEntry(oldValue: oldValue) }
  }
  open func didSetIsSecureTextEntry(oldValue: Bool) {
    textView?.isSecureTextEntry = isSecureTextEntry
  }
  
  // MARK: UITextFieldDelegateProxyDelegate
  
  open func textViewShouldBeginEditing() -> Bool {
    return true
  }
  
  open func textViewDidBeginEditing() {
    for object in didBeginEditingObservers.allObjects {
      guard let observer = object as? AUITextViewControllerDidBeginEditingObserver else { continue }
      observer.textViewControllerDidBeginEditing(self)
    }
  }
  
  open func textViewShouldEndEditing() -> Bool {
    return true
  }
  
  open func textViewDidEndEditing() {
    for object in didEndEditingObservers.allObjects {
      guard let observer = object as? AUITextViewControllerDidEndEditingObserver else { continue }
      observer.textViewControllerDidEndEditing(self)
    }
  }
  
  open func textView(shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    return true
  }
  
  open func textViewDidChange() {
    if let textView = textView {
      text = textView.text
    }
  }
  
  open func textViewDidChangeSelection() {
    
  }
  
  open func textView(shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
    return true
  }
  
  open func textView(shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
    return true
  }
  
}

private protocol UITextFieldDelegateProxyDelegate: class {
  func textViewShouldBeginEditing() -> Bool
  func textViewDidBeginEditing()
  func textViewShouldEndEditing() -> Bool
  func textViewDidEndEditing()
  func textView(shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
  func textViewDidChange()
  func textViewDidChangeSelection()
  func textView(shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool
  func textView(shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool
}

private class UITextViewDelegateProxy: NSObject, UITextViewDelegate {
  weak var delegate: UITextFieldDelegateProxyDelegate?
  
  func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
    return delegate?.textViewShouldBeginEditing() ?? true
  }
  
  func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
    return delegate?.textViewShouldEndEditing() ?? true
  }
  
  func textViewDidBeginEditing(_ textView: UITextView) {
    delegate?.textViewDidBeginEditing()
  }
  
  func textViewDidEndEditing(_ textView: UITextView) {
    delegate?.textViewDidEndEditing()
  }
  
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    return delegate?.textView(shouldChangeTextIn: range, replacementText: text) ?? true
  }
  
  func textViewDidChange(_ textView: UITextView) {
    delegate?.textViewDidChange()
  }
  
  func textViewDidChangeSelection(_ textView: UITextView) {
    delegate?.textViewDidChangeSelection()
  }
  
  func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
    return delegate?.textView(shouldInteractWith: URL, in: characterRange, interaction: interaction) ?? true
  }
  
  func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
    return delegate?.textView(shouldInteractWith: textAttachment, in: characterRange, interaction: interaction) ?? true
  }
  
}
