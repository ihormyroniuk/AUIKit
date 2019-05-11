//
//  AUIDefaultSubtextViewViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 2/16/19.
//

import Foundation

open class AUIDefaultSubtextViewViewController: AUIDefaultSubcontrolViewController, AUISubtextViewViewController, AUITextViewControllerDidChangeTextDelegate, AUITextViewControllerDidBeginEditingDelegate, AUITextViewControllerDidEndEditingDelegate {
  
  // MARK: Delegates
  
  open weak var subtextViewControllerDidChangeTextDelegate: AUITextViewControllerDidChangeTextDelegate?
  open weak var subtextViewControllerDidBeginEditingDelegate: AUITextViewControllerDidBeginEditingDelegate?
  open weak var subtextViewControllerDidEndEditingDelegate: AUITextViewControllerDidEndEditingDelegate?
  
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
    subtextViewController?.didChangeTextDelegate = self
    subtextViewController?.didBeginEditingDelegate = self
    subtextViewController?.didEndEditingDelegate = self
  }
  
  open override func unsetupSubcontrolController() {
    super.unsetupSubcontrolController()
    unsetupSubtextFieldController()
  }
  
  open func unsetupSubtextFieldController() {
    subtextViewController?.didChangeTextDelegate = nil
    subtextViewController?.didBeginEditingDelegate = nil
    subtextViewController?.didEndEditingDelegate = nil
  }
  
  // MARK: Events
  
  open func textViewControllerDidEndEditing(_ textViewController: AUITextViewController) {
    subtextViewControllerDidEndEditingDelegate?.textViewControllerDidEndEditing(textViewController)
  }

  open func textViewControllerDidChangeText(_ textViewController: AUITextViewController) {
    subtextViewControllerDidChangeTextDelegate?.textViewControllerDidChangeText(textViewController)
  }
  
  open func textViewControllerDidBeginEditing(_ textViewController: AUITextViewController) {
    subtextViewControllerDidBeginEditingDelegate?.textViewControllerDidBeginEditing(textViewController)
  }
}
