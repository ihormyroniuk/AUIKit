//
//  AUIDefaultResponsiveSubtextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/17/19.
//

import UIKit

open class AUIResponsiveTextFieldInputViewController: AUIEmptyTextFieldInputViewController {
  
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
      responsiveSubtextFieldView?.responsiveSubtextInputViewDidBecomeNonEmpty(animated: textFieldController.isFirstResponder)
    } else {
      responsiveSubtextFieldView?.responsiveSubtextInputViewDidBecomeEmpty(animated: textFieldController.isFirstResponder)
    }
    if !textFieldController.isFirstResponder {
      if self.textFieldController?.text?.isEmpty == false {
        responsiveSubtextFieldView?.responsiveSubtextInputViewDidEndEditingNonempty(animated: false)
      } else {
        responsiveSubtextFieldView?.responsiveSubtextInputViewDidEndEditingEmpty(animated: false)
      }
    }
  }
  
  open override func textFieldControllerDidBeginEditing(_ controller: AUITextFieldController) {
    super.textFieldControllerDidBeginEditing(controller)
    if self.textFieldController?.text?.isEmpty == false {
      responsiveSubtextFieldView?.responsiveSubtextInputViewDidBeginEditingNonempty(animated: true)
    } else {
      responsiveSubtextFieldView?.responsiveSubtextInputViewDidBeginEditingEmpty(animated: true)
    }
  }
  
  open override func textFieldControllerDidEndEditing(_ textFieldController: AUITextFieldController) {
    super.textFieldControllerDidEndEditing(textFieldController)
    if self.textFieldController?.text?.isEmpty == false {
      responsiveSubtextFieldView?.responsiveSubtextInputViewDidEndEditingNonempty(animated: true)
    } else {
      responsiveSubtextFieldView?.responsiveSubtextInputViewDidEndEditingEmpty(animated: true)
    }
  }
  
  open override func textFieldControllerDidEndEditingReason(_ controller: AUITextFieldController, reason: UITextField.DidEndEditingReason) {
    super.textFieldControllerDidEndEditingReason(controller, reason: reason)
    if self.textFieldController?.text?.isEmpty == false {
      responsiveSubtextFieldView?.responsiveSubtextInputViewDidEndEditingNonempty(animated: true)
    } else {
      responsiveSubtextFieldView?.responsiveSubtextInputViewDidEndEditingEmpty(animated: true)
    }
  }
  
}
