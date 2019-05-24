//
//  AUIDefaultSubcontrolViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

open class AUIDefaultSubcontrolViewController: AUIDefaultSubviewViewController, AUISubcontrolViewController, AUIControlControllerDidTouchDownDelegate, AUIControlControllerDidTouchUpInsideDelegate, AUIControlControllerDidEditingChangedDelegate, AUIControlControllerDidValueChangedDelegate, AUIControlControllerDidTouchUpOutsideDelegate {
  
  // MARK: Delegates
  
  open weak var subcontrolControllerDidTouchDownDelegate: AUIControlControllerDidTouchDownDelegate?
  open weak var subcontrolControllerDidTouchUpInsideDelegate: AUIControlControllerDidTouchUpInsideDelegate?
  open weak var subcontrolControllerDidTouchUpOutsideDelegate: AUIControlControllerDidTouchUpOutsideDelegate?
  open weak var subcontrolControllerDidValueChangedDelegate: AUIControlControllerDidValueChangedDelegate?
  open weak var subcontrolControllerDidEditingChangedDelegate: AUIControlControllerDidEditingChangedDelegate?
  
  // MARK: Subcontrol Controller
  
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
    subcontrolController?.didTouchDownDelegate = self
    subcontrolController?.didTouchUpInsideDelegate = self
    subcontrolController?.didTouchUpOutsideDelegate = self
    subcontrolController?.didValueChangedDelegate = self
    subcontrolController?.didEditingChangedDelegate = self
  }
  
  open override func unsetupSubviewController() {
    super.unsetupSubviewController()
    unsetupSubcontrolController()
  }
  
  open func unsetupSubcontrolController() {
    subcontrolController?.didTouchDownDelegate = nil
    subcontrolController?.didTouchUpInsideDelegate = nil
    subcontrolController?.didTouchUpOutsideDelegate = nil
    subcontrolController?.didValueChangedDelegate = nil
    subcontrolController?.didEditingChangedDelegate = nil
  }
  
  // MARK: Events
  
  public func controlControllerDidTouchDown(_ controlController: AUIControlController) {
    subcontrolControllerDidTouchDownDelegate?.controlControllerDidTouchDown(controlController)
  }
  
  open func controlControllerDidTouchUpInside(_ controlController: AUIControlController) {
    subcontrolControllerDidTouchUpInsideDelegate?.controlControllerDidTouchUpInside(controlController)
  }
  
  public func controlControllerDidTouchUpOutside(_ controlController: AUIControlController) {
    subcontrolControllerDidTouchUpOutsideDelegate?.controlControllerDidTouchUpOutside(controlController)
  }
  
  open func controlControllerDidValueChanged(_ controlController: AUIControlController) {
    subcontrolControllerDidValueChangedDelegate?.controlControllerDidValueChanged(controlController)
  }
  
  open func controlControllerDidEditingChanged(_ controlController: AUIControlController) {
    subcontrolControllerDidEditingChangedDelegate?.controlControllerDidEditingChanged(controlController)
  }
}
