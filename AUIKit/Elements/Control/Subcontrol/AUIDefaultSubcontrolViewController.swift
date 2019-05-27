//
//  AUIDefaultSubcontrolViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

open class AUIDefaultSubcontrolViewController: AUIDefaultSubviewViewController, AUISubcontrolViewController, AUIControlControllerDidTouchDownObserver, AUIControlControllerDidTouchUpInsideObserver, AUIControlControllerDidEditingChangedObserver, AUIControlControllerDidValueChangedObserver, AUIControlControllerDidTouchUpOutsideObserver {
  
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
    subcontrolController?.addDidTouchDownObserver(self)
    subcontrolController?.addDidTouchUpInsideObserver(self)
    subcontrolController?.addDidTouchUpOutsideObserver(self)
    subcontrolController?.addDidValueChangedObserver(self)
    subcontrolController?.addDidEditingChangedObserver(self)
  }
  
  open override func unsetupSubviewController() {
    super.unsetupSubviewController()
    unsetupSubcontrolController()
  }
  
  open func unsetupSubcontrolController() {
    subcontrolController?.removeDidTouchDownObserver(self)
    subcontrolController?.removeDidTouchUpInsideObserver(self)
    subcontrolController?.removeDidTouchUpOutsideObserver(self)
    subcontrolController?.removeDidValueChangedObserver(self)
    subcontrolController?.removeDidEditingChangedObserver(self)
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
