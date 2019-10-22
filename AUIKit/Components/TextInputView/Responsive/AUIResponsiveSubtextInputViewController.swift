//
//  AUIDefaultResponsiveSubtextInputViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 8/2/19.
//

import Foundation

import UIKit

open class AUIResponsiveSubtextViewViewController: AUIEmptyTextViewInputViewController {

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
      responsiveSubtextInputView?.responsiveSubtextInputViewDidBecomeNonEmpty(animated: textViewController.isFirstResponder)
    } else {
      responsiveSubtextInputView?.responsiveSubtextInputViewDidBecomeEmpty(animated: textViewController.isFirstResponder)
    }
    if !textViewController.isFirstResponder {
      if self.textViewController?.text?.isEmpty == false {
        responsiveSubtextInputView?.responsiveSubtextInputViewDidEndEditingNonempty(animated: false)
      } else {
        responsiveSubtextInputView?.responsiveSubtextInputViewDidEndEditingEmpty(animated: false)
      }
    }
  }
  
  open override func textViewControllerDidBeginEditing(_ textViewController: AUITextViewController) {
    super.textViewControllerDidBeginEditing(textViewController)
    if self.textViewController?.text?.isEmpty == false {
      responsiveSubtextInputView?.responsiveSubtextInputViewDidBeginEditingNonempty(animated: true)
    } else {
      responsiveSubtextInputView?.responsiveSubtextInputViewDidBeginEditingEmpty(animated: true)
    }
  }
  
  open override func textViewControllerDidEndEditing(_ textViewController: AUITextViewController) {
    super.textViewControllerDidEndEditing(textViewController)
    if self.textViewController?.text?.isEmpty == false {
      responsiveSubtextInputView?.responsiveSubtextInputViewDidEndEditingNonempty(animated: true)
    } else {
      responsiveSubtextInputView?.responsiveSubtextInputViewDidEndEditingEmpty(animated: true)
    }
  }

}
