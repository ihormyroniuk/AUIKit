//
//  AUIDefaultResponsiveSubtextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/17/19.
//

import UIKit

open class AUIResponsiveTextFieldTextInputViewController: AUIEmptyTextFieldTextInputViewController {
  
  // MARK: ResponsiveSubtextFieldView
  
  open var responsiveSubtextFieldView: AUIResponsiveTextInputView? {
    get { return view as? AUIResponsiveTextInputView }
    set { view = newValue }
  }
  
  // MARK: View
  
  open override func setupView() {
    super.setupView()
    
  }
  
  // MARK: Events
  
  open override func textFieldControllerDidChangeText(_ textFieldController: AUITextFieldController) {
    super.textFieldControllerDidChangeText(textFieldController)
    if textFieldController.text?.isEmpty == false {
      responsiveSubtextFieldView?.responsiveTextInputViewDidBecomeNonEmpty(animated: textFieldController.isFirstResponder)
    } else {
      responsiveSubtextFieldView?.responsiveTextInputViewDidBecomeEmpty(animated: textFieldController.isFirstResponder)
    }
    if !textFieldController.isFirstResponder {
      if self.textFieldController?.text?.isEmpty == false {
        responsiveSubtextFieldView?.responsiveTextInputViewDidEndEditingNonempty(animated: false)
      } else {
        responsiveSubtextFieldView?.responsiveTextInputViewDidEndEditingEmpty(animated: false)
      }
    }
  }
  
  open override func textFieldControllerDidBeginEditing(_ controller: AUITextFieldController) {
    super.textFieldControllerDidBeginEditing(controller)
    if self.textFieldController?.text?.isEmpty == false {
      responsiveSubtextFieldView?.responsiveTextInputViewDidBeginEditingNonempty(animated: true)
    } else {
      responsiveSubtextFieldView?.responsiveTextInputViewDidBeginEditingEmpty(animated: true)
    }
  }
  
  open override func textFieldControllerDidEndEditing(_ textFieldController: AUITextFieldController) {
    super.textFieldControllerDidEndEditing(textFieldController)
    if self.textFieldController?.text?.isEmpty == false {
      responsiveSubtextFieldView?.responsiveTextInputViewDidEndEditingNonempty(animated: true)
    } else {
      responsiveSubtextFieldView?.responsiveTextInputViewDidEndEditingEmpty(animated: true)
    }
  }
  
  open override func textFieldControllerDidEndEditingReason(_ controller: AUITextFieldController, reason: UITextField.DidEndEditingReason) {
    super.textFieldControllerDidEndEditingReason(controller, reason: reason)
    if self.textFieldController?.text?.isEmpty == false {
      responsiveSubtextFieldView?.responsiveTextInputViewDidEndEditingNonempty(animated: true)
    } else {
      responsiveSubtextFieldView?.responsiveTextInputViewDidEndEditingEmpty(animated: true)
    }
  }
  
}
