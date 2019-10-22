//
//  AUIDefaultResponsiveSubtextInputViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 8/2/19.
//

import Foundation

import UIKit

open class AUIResponsiveTextViewTextInputViewController: AUIEmptyTextViewTextInputViewController {

  // MARK: ResponsiveSubtextViewView
  
  open var responsiveSubtextInputView: AUIResponsiveTextInputView? {
    get { return view as? AUIResponsiveTextInputView }
    set { view = newValue }
  }
  
  // MARK: View
  
  open override func setupView() {
    super.setupView()
    
  }
  
  // MARK: Events
  
  open override func textViewControllerDidChangeText(_ textViewController: AUITextViewController) {
    super.textViewControllerDidChangeText(textViewController)
    if textViewController.text?.isEmpty == false {
      responsiveSubtextInputView?.responsiveTextInputViewDidBecomeNonEmpty(animated: textViewController.isFirstResponder)
    } else {
      responsiveSubtextInputView?.responsiveTextInputViewDidBecomeEmpty(animated: textViewController.isFirstResponder)
    }
    if !textViewController.isFirstResponder {
      if self.textViewController?.text?.isEmpty == false {
        responsiveSubtextInputView?.responsiveTextInputViewDidEndEditingNonempty(animated: false)
      } else {
        responsiveSubtextInputView?.responsiveTextInputViewDidEndEditingEmpty(animated: false)
      }
    }
  }
  
  open override func textViewControllerDidBeginEditing(_ textViewController: AUITextViewController) {
    super.textViewControllerDidBeginEditing(textViewController)
    if self.textViewController?.text?.isEmpty == false {
      responsiveSubtextInputView?.responsiveTextInputViewDidBeginEditingNonempty(animated: true)
    } else {
      responsiveSubtextInputView?.responsiveTextInputViewDidBeginEditingEmpty(animated: true)
    }
  }
  
  open override func textViewControllerDidEndEditing(_ textViewController: AUITextViewController) {
    super.textViewControllerDidEndEditing(textViewController)
    if self.textViewController?.text?.isEmpty == false {
      responsiveSubtextInputView?.responsiveTextInputViewDidEndEditingNonempty(animated: true)
    } else {
      responsiveSubtextInputView?.responsiveTextInputViewDidEndEditingEmpty(animated: true)
    }
  }

}
