//
//  AUIDefaultSubtextViewViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 2/16/19.
//

import Foundation

open class AUIEmptyTextViewTextInputViewController: AUIEmptyViewController, AUITextViewInputTextViewController, AUITextViewControllerDidChangeTextObserver, AUITextViewControllerDidBeginEditingObserver, AUITextViewControllerDidEndEditingObserver {
  
    // MARK: TextFieldInputView
    
    open var textViewInputView: AUITextViewTextInputView? {
        set { view = newValue }
        get { return view as? AUITextViewTextInputView }
    }
    
    open override func setupView() {
        super.setupView()
        setupTextViewInputView()
    }
    
    open func setupTextViewInputView() {
        textViewController?.textView = textViewInputView?.textView
    }
    
    open override func unsetupView() {
        super.unsetupView()
        unsetupTextViewInputView()    }
    
    open func unsetupTextViewInputView() {
        textViewController?.textView = nil
    }
    
    // MARK: TextViewController
  
    open var textViewController: AUITextViewController? {
        didSet {
            didSetTextViewController(oldValue)
        }
    }
    
    open func didSetTextViewController(_ oldValue: AUITextViewController?) {
        guard textViewController !== oldValue else { return }
        oldValue?.removeDidChangeTextObserver(self)
        oldValue?.removeDidBeginEditingObserver(self)
        oldValue?.removeDidEndEditingObserver(self)
        oldValue?.textView = nil
        textViewController?.addDidChangeTextObserver(self)
        textViewController?.addDidBeginEditingObserver(self)
        textViewController?.addDidEndEditingObserver(self)
        textViewController?.textView = textViewInputView?.textView
    }
  
    // MARK: Events
  
    open func textViewControllerDidEndEditing(_ textViewController: AUITextViewController) {
        
    }

    open func textViewControllerDidChangeText(_ textViewController: AUITextViewController) {
        
    }
  
    open func textViewControllerDidBeginEditing(_ textViewController: AUITextViewController) {
        
    }
    
}
