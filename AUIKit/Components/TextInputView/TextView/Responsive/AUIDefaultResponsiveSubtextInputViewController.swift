//
//  AUIDefaultResponsiveSubtextInputViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 8/2/19.
//

import Foundation

import UIKit

open class AUIDefaultResponsiveSubtextViewViewController: AUIDefaultSubtextViewViewController, AUIResponsiveSubtextViewViewController {

  // MARK: ResponsiveSubtextViewView
  
  open var responsiveSubtextInputView: AUIResponsiveSubtextInputView? {
    get {
      return view as? AUIResponsiveSubtextInputView
    }
    set {
      view = newValue as? UIView
    }
  }
  
  // MARK: View
  
  open override func setupView() {
    super.setupView()
    
  }
  
  // MARK: Events
  
  open override func textViewControllerDidChangeText(_ textViewController: AUITextViewController) {
    super.textViewControllerDidChangeText(textViewController)
    if textViewController.text?.isEmpty == false {
      responsiveSubtextInputView?.responsiveSubtextInputViewDidBecomeNonEmpty(animated: textViewController.isFirstResponder)
    } else {
      responsiveSubtextInputView?.responsiveSubtextInputViewDidBecomeEmpty(animated: textViewController.isFirstResponder)
    }
    if !textViewController.isFirstResponder {
      if subtextViewController?.text?.isEmpty == false {
        responsiveSubtextInputView?.responsiveSubtextInputViewDidEndEditingNonempty(animated: false)
      } else {
        responsiveSubtextInputView?.responsiveSubtextInputViewDidEndEditingEmpty(animated: false)
      }
    }
  }
  
  open override func textViewControllerDidBeginEditing(_ controller: AUITextViewController) {
    super.textViewControllerDidBeginEditing(controller)
    if subtextViewController?.text?.isEmpty == false {
      responsiveSubtextInputView?.responsiveSubtextInputViewDidBeginEditingNonempty(animated: true)
    } else {
      responsiveSubtextInputView?.responsiveSubtextInputViewDidBeginEditingEmpty(animated: true)
    }
  }
  
  open override func textViewControllerDidEndEditing(_ textViewController: AUITextViewController) {
    super.textViewControllerDidEndEditing(textViewController)
    if subtextViewController?.text?.isEmpty == false {
      responsiveSubtextInputView?.responsiveSubtextInputViewDidEndEditingNonempty(animated: true)
    } else {
      responsiveSubtextInputView?.responsiveSubtextInputViewDidEndEditingEmpty(animated: true)
    }
  }

}
