//
//  AUIDefaultSubcontrolViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

open class AUIDefaultSubcontrolViewController: AUIDefaultSubviewViewController, AUISubcontrolViewController, AUIControlControllerDidTouchDownDelegate, AUIControlControllerDidTouchUpInsideDelegate, AUIControlControllerDidEditingChangedDelegate, AUIControlControllerDidValueChangedDelegate, AUIControlControllerDidTouchUpOutsideDelegate {
  
  // MARK: Delegates
  
  open weak var subcontrolViewControllerDidTouchDownDelegate: AUISubcontrolViewControllerDidTouchDownDelegate?
  open weak var subcontrolViewControllerDidTouchUpInsideDelegate: AUISubcontrolViewControllerDidTouchUpInsideDelegate?
  open weak var subcontrolViewControllerDidTouchUpOutsideDelegate: AUISubcontrolViewControllerDidTouchUpOutsideDelegate?
  open weak var subcontrolViewControllerDidValueChangedDelegate: AUISubcontrolViewControllerDidValueChangedDelegate?
  open weak var subcontrolViewControllerDidEditingChangedDelegate: AUISubcontrolViewControllerDidEditingChangedDelegate?
  
  // MARK: SubcontrolController
  
  open var subcontrolController: AUIControlController? {
    set {
      subviewController = newValue
    }
    get {
      return subviewController as? AUIControlController
    }
  }
  
  open override func setupSubviewController() {
    super.setupSubviewController()
    setupSubcontrolController()
  }
  
  open func setupSubcontrolController() {
    /*subcontrolController?.didTouchDownDelegate = self
    subcontrolController?.didTouchUpInsideDelegate = self
    subcontrolController?.didTouchUpOutsideDelegate = self
    subcontrolController?.didValueChangedDelegate = self
    subcontrolController?.didEditingChangedDelegate = self*/
  }
  
  open override func unsetupSubviewController() {
    super.unsetupSubviewController()
    unsetupSubcontrolController()
  }
  
  open func unsetupSubcontrolController() {
    /*subcontrolController?.didTouchDownDelegate = nil
    subcontrolController?.didTouchUpInsideDelegate = nil
    subcontrolController?.didTouchUpOutsideDelegate = nil
    subcontrolController?.didValueChangedDelegate = nil
    subcontrolController?.didEditingChangedDelegate = nil*/
  }
  
  // MARK: Events
  
  public func controlControllerDidTouchDown(_ controlController: AUIControlController) {
    subcontrolViewControllerDidTouchDownDelegate?.subcontrolViewControllerDidTouchDown(self)
  }
  
  open func controlControllerDidTouchUpInside(_ controlController: AUIControlController) {
    subcontrolViewControllerDidTouchUpInsideDelegate?.subcontrolViewControllerDidTouchUpInside(self)
  }
  
  public func controlControllerDidTouchUpOutside(_ controlController: AUIControlController) {
    subcontrolViewControllerDidTouchUpOutsideDelegate?.subcontrolViewControllerDidTouchUpOutside(self)
  }
  
  open func controlControllerDidValueChanged(_ controlController: AUIControlController) {
    subcontrolViewControllerDidValueChangedDelegate?.subcontrolViewControllerDidValueChanged(self)
  }
  
  open func controlControllerDidEditingChanged(_ controlController: AUIControlController) {
    subcontrolViewControllerDidEditingChangedDelegate?.subcontrolViewControllerDidEditingChanged(self)
  }
}
