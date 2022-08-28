//
//  AUIDefaultSubtextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation
import UIKit

open class AUIEmptyTextFieldTextInputViewController: AUIEmptyViewController, AUITextFieldTextInputViewController, AUITextFieldControllerDidEndEditingObserver, AUITextFieldControllerDidEndEditingReasonObserver {
    
    open var didChangeText: (() -> Void)?

    open var didTapReturnKey: (() -> Bool)?
    
    open var didBeginEditing: (() -> Void)?
    
    // MARK: AUITextFieldInputView
    
    public var textFieldInputView: AUITextFieldTextInputView? {
        set { view = newValue }
        get { return view as? AUITextFieldTextInputView }
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
        oldValue?.didChangeText = nil
        oldValue?.didTapReturnKey = nil
        oldValue?.didBeginEditing = nil
        oldValue?.removeDidEndEditingObserver(self)
        oldValue?.removeDidEndEditingReasonObserver(self)
        oldValue?.textField = nil
        textFieldController?.didChangeText = { [weak self] in
            guard let self = self else { return }
            self.textFieldControllerDidChangeText()
        }
        textFieldController?.didTapReturnKey = { [weak self] in
            guard let self = self else { return true }
            return self.textFieldControllerDidTapReturnKey()
        }
        textFieldController?.didBeginEditing = { [weak self] in
            guard let self = self else { return }
            self.textFieldControllerDidBeginEditing()
        }
        textFieldController?.addDidEndEditingObserver(self)
        textFieldController?.addDidEndEditingReasonObserver(self)
        textFieldController?.textField = textFieldInputView?.textField
    }
    
    // MARK: Events
  
    open func textFieldControllerDidChangeText() {
        guard let didChangeText = didChangeText else { return }
        didChangeText()
    }
  
    open func textFieldControllerDidTapReturnKey() -> Bool {
        guard let didTapReturnKey = didTapReturnKey else { return true }
        return didTapReturnKey()
    }
  
    open func textFieldControllerDidBeginEditing() {
        guard let didBeginEditing = didBeginEditing else { return }
        didBeginEditing()
    }
  
    open func textFieldControllerDidEndEditing(_ textFieldController: AUITextFieldController) {
        
    }
  
    open func textFieldControllerDidEndEditingReason(_ textFieldController: AUITextFieldController, reason: UITextField.DidEndEditingReason) {
        
    }
    
}
