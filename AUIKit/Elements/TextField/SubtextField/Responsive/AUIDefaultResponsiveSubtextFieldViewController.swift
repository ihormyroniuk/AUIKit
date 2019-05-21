//
//  AUIDefaultResponsiveSubtextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/17/19.
//

import UIKit

open class AUIDefaultResponsiveSubtextFieldViewController: AUIDefaultSubtextFieldViewController, AUIResponsiveSubtextFieldViewController {
  
  open var responsiveSubtextFieldView: AUIResponsiveSubtextFieldView? {
    get {
      return view as? AUIResponsiveSubtextFieldView
    }
    set {
      view = newValue as? UIView
    }
  }
  
  open override func textFieldControllerDidBeginEditing(_ controller: AUITextFieldController) {
    super.textFieldControllerDidBeginEditing(controller)
    if subtextFieldController?.text?.isEmpty == false {
      responsiveSubtextFieldView?.responsiveSubtextFieldDidBeginEditingNonempty(animated: true)
    } else {
      responsiveSubtextFieldView?.responsiveSubtextFieldDidBeginEditingEmpty(animated: true)
    }
  }
  
  open override func textFieldControllerDidEndEditing(_ textFieldController: AUITextFieldController) {
    super.textFieldControllerDidEndEditing(textFieldController)
    if subtextFieldController?.text?.isEmpty == false {
      responsiveSubtextFieldView?.responsiveSubtextFieldDidEndEditingNonempty(animated: true)
    } else {
      responsiveSubtextFieldView?.responsiveSubtextFieldDidEndEditingEmpty(animated: true)
    }
  }
  
  open override func textFieldControllerDidEndEditingReason(_ controller: AUITextFieldController, reason: UITextField.DidEndEditingReason) {
    super.textFieldControllerDidEndEditingReason(controller, reason: reason)
    if subtextFieldController?.text?.isEmpty == false {
      responsiveSubtextFieldView?.responsiveSubtextFieldDidEndEditingNonempty(animated: true)
    } else {
      responsiveSubtextFieldView?.responsiveSubtextFieldDidEndEditingEmpty(animated: true)
    }
  }
  
}
