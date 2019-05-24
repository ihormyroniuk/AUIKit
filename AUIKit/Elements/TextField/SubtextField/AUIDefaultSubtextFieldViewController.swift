//
//  AUIDefaultSubtextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

open class AUIDefaultSubtextFieldViewController: AUIDefaultSubcontrolViewController, AUISubtextFieldViewController, AUITextFieldControllerDidChangeTextDelegate, AUITextFieldControllerDidTapReturnKeyDelegate, AUITextFieldControllerDidBeginEditingDelegate, AUITextFieldControllerDidEndEditingDelegate, AUITextFieldControllerDidEndEditingReasonDelegate {
  
  // MARK: Delegates
  
  open weak var subtextFieldViewControllerDidChangeTextDelegate: AUISubtextFieldViewControllerDidChangeTextDelegate?
  open weak var subtextFieldViewControllerDidTapReturnKeyDelegate: AUISubtextFieldViewControllerDidTapReturnKeyDelegate?
  open weak var subtextFieldViewControllerDidBeginEditingDelegate: AUISubtextFieldViewControllerDidBeginEditingDelegate?
  open weak var subtextFieldViewControllerDidEndEditingDelegate: AUISubtextFieldViewControllerDidEndEditingDelegate?
  open weak var subtextFieldViewControllerDidEndEditingReasonDelegate: AUISubtextFieldViewControllerDidEndEditingReasonDelegate?
  
  // MARK: SubtextFieldController
  
  open var subtextFieldController: AUITextFieldController? {
    set { subviewController = newValue }
    get { return subviewController as? AUITextFieldController }
  }
  
  open override func setupSubcontrolController() {
    super.setupSubcontrolController()
    setupSubtextFieldController()
  }
  
  open func setupSubtextFieldController() {
    subtextFieldController?.didChangeTextDelegate = self
    subtextFieldController?.didTapReturnKeyDelegate = self
    subtextFieldController?.didBeginEditingDelegate = self
    subtextFieldController?.didEndEditingDelegate = self
    subtextFieldController?.didEndEditingReasonDelegate = self
  }
  
  open override func unsetupSubcontrolController() {
    super.unsetupSubcontrolController()
    unsetupSubtextFieldController()
  }
  
  open func unsetupSubtextFieldController() {
    subtextFieldController?.didChangeTextDelegate = nil
    subtextFieldController?.didTapReturnKeyDelegate = nil
    subtextFieldController?.didBeginEditingDelegate = nil
    subtextFieldController?.didEndEditingDelegate = nil
    subtextFieldController?.didEndEditingReasonDelegate = nil
  }
  
  // MARK: Events
  
  open func textFieldControllerDidChangeText(_ textFieldController: AUITextFieldController) {
    subtextFieldViewControllerDidChangeTextDelegate?.textFieldViewControllerDidChangeText(self)
  }
  
  open func textFieldControllerDidTapReturnKey(_ textFieldController: AUITextFieldController) {
    subtextFieldViewControllerDidTapReturnKeyDelegate?.textFieldViewControllerDidTapReturnKey(self)
  }
  
  open func textFieldControllerDidBeginEditing(_ textFieldController: AUITextFieldController) {
    subtextFieldViewControllerDidBeginEditingDelegate?.textFieldViewControllerDidBeginEditing(self)
  }
  
  open func textFieldControllerDidEndEditing(_ textFieldController: AUITextFieldController) {
    subtextFieldViewControllerDidEndEditingDelegate?.textFieldViewControllerDidEndEditing(self)
  }
  
  open func textFieldControllerDidEndEditingReason(_ textFieldController: AUITextFieldController, reason: UITextField.DidEndEditingReason) {
   subtextFieldViewControllerDidEndEditingReasonDelegate?.textFieldViewControllerDidEndEditingReason(self, reason: reason)
  }
}
