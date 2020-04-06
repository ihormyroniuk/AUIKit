//
//  AUIDefaultResponsiveSubtextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/17/19.
//

import UIKit

open class AUIResponsiveTextFieldTextInputViewController: AUIEmptyTextFieldTextInputViewController {
  
    // MARK: ResponsiveSubtextFieldView
  
    open var responsiveTextInputView: AUIResponsiveTextInputView? {
        get { return view as? AUIResponsiveTextInputView }
        set { view = newValue }
    }
  
    // MARK: Events
  
    open override func textFieldControllerDidChangeText(_ textFieldController: AUITextFieldController) {
        super.textFieldControllerDidChangeText(textFieldController)
        if textFieldController.text?.isEmpty == false {
            responsiveTextInputView?.responsiveTextInputViewDidBecomeNonEmpty(animated: textFieldController.isFirstResponder)
        } else {
            responsiveTextInputView?.responsiveTextInputViewDidBecomeEmpty(animated: textFieldController.isFirstResponder)
        }
        if !textFieldController.isFirstResponder {
            if self.textFieldController?.text?.isEmpty == false {
                responsiveTextInputView?.responsiveTextInputViewDidEndEditingNonempty(animated: false)
            } else {
                responsiveTextInputView?.responsiveTextInputViewDidEndEditingEmpty(animated: false)
            }
        }
    }
  
    open override func textFieldControllerDidBeginEditing(_ controller: AUITextFieldController) {
        super.textFieldControllerDidBeginEditing(controller)
        if self.textFieldController?.text?.isEmpty == false {
            responsiveTextInputView?.responsiveTextInputViewDidBeginEditingNonempty(animated: true)
        } else {
            responsiveTextInputView?.responsiveTextInputViewDidBeginEditingEmpty(animated: true)
        }
    }
  
    open override func textFieldControllerDidEndEditing(_ textFieldController: AUITextFieldController) {
        super.textFieldControllerDidEndEditing(textFieldController)
        if self.textFieldController?.text?.isEmpty == false {
            responsiveTextInputView?.responsiveTextInputViewDidEndEditingNonempty(animated: true)
        } else {
            responsiveTextInputView?.responsiveTextInputViewDidEndEditingEmpty(animated: true)
        }
    }
  
    open override func textFieldControllerDidEndEditingReason(_ controller: AUITextFieldController, reason: UITextField.DidEndEditingReason) {
        super.textFieldControllerDidEndEditingReason(controller, reason: reason)
        if self.textFieldController?.text?.isEmpty == false {
            responsiveTextInputView?.responsiveTextInputViewDidEndEditingNonempty(animated: true)
        } else {
            responsiveTextInputView?.responsiveTextInputViewDidEndEditingEmpty(animated: true)
        }
    }
  
}
