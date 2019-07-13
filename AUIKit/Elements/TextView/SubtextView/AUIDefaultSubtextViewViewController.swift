//
//  AUIDefaultSubtextViewViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 2/16/19.
//

import Foundation

open class AUIDefaultSubtextViewViewController: AUIDefaultSubcontrolViewController, AUISubtextViewViewController, AUITextViewControllerDidChangeTextObserver, AUITextViewControllerDidBeginEditingObserver, AUITextViewControllerDidEndEditingObserver {
  
  // MARK: SubtextField
  
  open var subtextViewController: AUITextViewController? {
    set { subviewController = newValue }
    get { return subviewController as? AUITextViewController }
  }
  
  open override func setupSubcontrolController() {
    super.setupSubcontrolController()
    setupSubtextFieldController()
  }
  
  open func setupSubtextFieldController() {
    subtextViewController?.addDidChangeTextObserver(self)
    subtextViewController?.addDidBeginEditingObserver(self)
    subtextViewController?.addDidEndEditingObserver(self)
  }
  
  open override func unsetupSubcontrolController() {
    super.unsetupSubcontrolController()
    unsetupSubtextFieldController()
  }
  
  open func unsetupSubtextFieldController() {
    subtextViewController?.removeDidChangeTextObserver(self)
    subtextViewController?.removeDidBeginEditingObserver(self)
    subtextViewController?.removeDidEndEditingObserver(self)
  }
  
  // MARK: Events
  
  open func textViewControllerDidEndEditing(_ textViewController: AUITextViewController) {
   
  }

  open func textViewControllerDidChangeText(_ textViewController: AUITextViewController) {
   
  }
  
  open func textViewControllerDidBeginEditing(_ textViewController: AUITextViewController) {

  }
}
