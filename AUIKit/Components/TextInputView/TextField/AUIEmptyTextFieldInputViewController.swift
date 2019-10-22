//
//  AUIDefaultSubtextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

open class AUIEmptyTextFieldInputViewController: AUIDefaultViewController, AUITextFieldInputViewController, AUITextFieldControllerDidChangeTextObserver, AUITextFieldControllerDidTapReturnKeyObserver, AUITextFieldControllerDidBeginEditingObserver, AUITextFieldControllerDidEndEditingObserver, AUITextFieldControllerDidEndEditingReasonObserver {
    
    // MARK: AUITextFieldInputView
    
    public var textFieldInputView: AUITextFieldInputView? {
        set { view = newValue }
        get { return view as? AUITextFieldInputView }
    }
    
    open override func setupView() {
        super.setupView()
        setupTextFieldInputView()
    }
    
    open func setupTextFieldInputView() {
        textFieldController?.textField = textFieldInputView?.textField
    }
    
    open override func unsetupView() {
        super.unsetupView()
        unsetupTextFieldInputView()    }
    
    open func unsetupTextFieldInputView() {
        textFieldController?.textField = nil
    }
    
    // MARK: TextFieldController
  
    open var textFieldController: AUITextFieldController? {
        didSet {
            didSetTextFieldController(oldValue)
        }
    }
    
    open func didSetTextFieldController(_ oldValue: AUITextFieldController?) {
        guard textFieldController !== oldValue else { return }
        oldValue?.removeDidChangeTextObserver(self)
        oldValue?.removeDidTapReturnKeyObserver(self)
        oldValue?.removeDidBeginEditingObserver(self)
        oldValue?.removeDidEndEditingObserver(self)
        oldValue?.removeDidEndEditingReasonObserver(self)
        oldValue?.textField = nil
        textFieldController?.addDidChangeTextObserver(self)
        textFieldController?.addDidTapReturnKeyObserver(self)
        textFieldController?.addDidBeginEditingObserver(self)
        textFieldController?.addDidEndEditingObserver(self)
        textFieldController?.addDidEndEditingReasonObserver(self)
        textFieldController?.textField = textFieldInputView?.textField
    }
    
    // MARK: Events
  
    open func textFieldControllerDidChangeText(_ textFieldController: AUITextFieldController) {
        
    }
  
    open func textFieldControllerDidTapReturnKey(_ textFieldController: AUITextFieldController) {
        
    }
  
    open func textFieldControllerDidBeginEditing(_ textFieldController: AUITextFieldController) {
        
    }
  
    open func textFieldControllerDidEndEditing(_ textFieldController: AUITextFieldController) {
        
    }
  
    open func textFieldControllerDidEndEditingReason(_ textFieldController: AUITextFieldController, reason: UITextField.DidEndEditingReason) {
        
    }
    
}
