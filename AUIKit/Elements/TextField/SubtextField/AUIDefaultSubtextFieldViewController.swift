//
//  AUIDefaultSubtextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

open class AUIDefaultSubtextFieldViewController: AUIDefaultSubcontrolViewController, AUISubtextFieldViewController, AUITextFieldControllerDidChangeTextObserver, AUITextFieldControllerDidTapReturnKeyObserver, AUITextFieldControllerDidBeginEditingObserver, AUITextFieldControllerDidEndEditingObserver, AUITextFieldControllerDidEndEditingReasonObserver {
  
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
    subtextFieldController?.addDidChangeTextObserver(self)
    subtextFieldController?.addDidTapReturnKeyObserver(self)
    subtextFieldController?.addDidBeginEditingObserver(self)
    subtextFieldController?.addDidEndEditingObserver(self)
    subtextFieldController?.addDidEndEditingReasonObserver(self)
  }
  
  open override func unsetupSubcontrolController() {
    super.unsetupSubcontrolController()
    unsetupSubtextFieldController()
  }
  
  open func unsetupSubtextFieldController() {
    subtextFieldController?.removeDidChangeTextObserver(self)
    subtextFieldController?.removeDidTapReturnKeyObserver(self)
    subtextFieldController?.removeDidBeginEditingObserver(self)
    subtextFieldController?.removeDidEndEditingObserver(self)
    subtextFieldController?.removeDidEndEditingReasonObserver(self)
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
