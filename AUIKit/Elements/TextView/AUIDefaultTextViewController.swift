//
//  TextViewController.swift
//  Scenery
//
//  Created by Ihor Myroniuk on 8/2/18.
//  Copyright © 2018 Ihor Myroniuk. All rights reserved.
//

import UIKit

open class AUIDefaultTextViewController: AUIDefaultScrollViewController, AUITextViewController, UITextViewDelegateProxyDelegate, KeyValueObserverProxyDelegate {
  
  // MARK: - Delegates
  
  private let keyValueObserverProxy = KeyValueObserverProxy()
  private let textViewDelegate = UITextViewDelegateProxy()
  open weak var didChangeTextDelegate: AUITextViewControllerDidChangeTextDelegate?
  open weak var didBeginEditingDelegate: AUITextViewControllerDidBeginEditingDelegate?
  open weak var didEndEditingDelegate: AUITextViewControllerDidEndEditingDelegate?
  
  // MARK: - Setup
  
  open override func setup() {
    super.setup()
    keyValueObserverProxy.delegate = self
    textViewDelegate.delegate = self
  }
  
  // MARK: - States
  
  open var text: String? {
    didSet { didSetText(text) }
  }
  open func didSetText(_ text: String?) {
    textView?.text = text
    didChangeTextDelegate?.textViewControllerDidChangeText(self)
  }
  
  open var keyboardType: UIKeyboardType = .default {
    didSet { didSetKeyboardType(keyboardType) }
  }
  open func didSetKeyboardType(_ keyboardType: UIKeyboardType) {
    textView?.keyboardType = keyboardType
  }
  
  open var autocorrectionType: UITextAutocorrectionType = .default {
    didSet { didSetAutocorrectionType(autocorrectionType) }
  }
  open func didSetAutocorrectionType(_ type: UITextAutocorrectionType) {
    textView?.autocorrectionType = type
  }
  
  open var autocapitalizationType: UITextAutocapitalizationType = .none {
    didSet { didSetAutocapitalizationType(autocapitalizationType) }
  }
  open func didSetAutocapitalizationType(_ type: UITextAutocapitalizationType) {
    textView?.autocapitalizationType = type
  }
  
  // MARK: - View
  
  open var textView: UITextView? {
    set { view = newValue }
    get { return view as? UITextView }
  }
  
  open override func setupView() {
    super.setupView()
    textView?.delegate = textViewDelegate
    textView?.keyboardType = keyboardType
    textView?.autocorrectionType = autocorrectionType
    textView?.autocapitalizationType = autocapitalizationType
    textView?.text = text
  }
  
  open override func unsetupView() {
    super.unsetupView()
    textView?.delegate = nil
  }
  
  // MARK: - UITextViewDelegate
  
  open func textViewShouldBeginEditing() -> Bool {
    return true
  }
  
  open func textViewShouldEndEditing() -> Bool {
    return true
  }
  
  open func textViewDidBeginEditing() {
    didBeginEditingDelegate?.textViewControllerDidBeginEditing(self)
  }
  
  open func textViewDidEndEditing() {
    didEndEditingDelegate?.textViewControllerDidEndEditing(self)
  }
  
  open func textView(shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    return true
  }
  
  open func textViewDidChange() {
    
  }
  
  open func textViewDidChangeSelection() {
    
  }
  
  open func textView(shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
    return true
  }
  
  open func textView(shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
    return true
  }
  
  open func textView(shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
    return true
  }
  
  open func textView(shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange) -> Bool {
    return true
  }
  
  // MARK: - KeyValueObserverProxyDelegate
  
  func textViewDidChangeText(_ textView: UITextView) {
    text = textView.text
  }
  
}

private protocol UITextViewDelegateProxyDelegate: class {
  func textViewShouldBeginEditing() -> Bool
  func textViewShouldEndEditing() -> Bool
  func textViewDidBeginEditing()
  func textViewDidEndEditing()
  func textView(shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
  func textViewDidChange()
  func textViewDidChangeSelection()
  func textView(shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool
  func textView(shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool
  func textView(shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool
  func textView(shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange) -> Bool
}

private class UITextViewDelegateProxy: NSObject, UITextViewDelegate {
  
  weak var delegate: UITextViewDelegateProxyDelegate?
  
  func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
    return delegate?.textViewShouldBeginEditing() ?? false
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
    return delegate?.textView(shouldChangeTextIn: range, replacementText: text) ?? false
  }
  
  func textViewDidChange(_ textView: UITextView) {
    delegate?.textViewDidChange()
  }
  
  func textViewDidChangeSelection(_ textView: UITextView) {
    delegate?.textViewDidChangeSelection()
  }
  
  func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
    return delegate?.textView(shouldInteractWith: URL, in: characterRange, interaction: interaction) ?? false
  }
  
  func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
    return delegate?.textView(shouldInteractWith: textAttachment, in: characterRange, interaction: interaction) ?? false
  }
  
  func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
    return delegate?.textView(shouldInteractWith: URL, in: characterRange) ?? false
  }
  
  func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange) -> Bool {
    return delegate?.textView(shouldInteractWith: textAttachment, in: characterRange) ?? false
  }
  
}

// MARK: - KeyValueObserverProxy

private protocol KeyValueObserverProxyDelegate: class {
  func textViewDidChangeText(_ textView: UITextView)
}

private class KeyValueObserverProxy: NSObject {
  
  weak var delegate: KeyValueObserverProxyDelegate?
  
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath == "text", let textView = object as? UITextView { delegate?.textViewDidChangeText(textView) }
  }
}
