//
//  AUIDefaultSubcontrolViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

open class AUIDefaultSubcontrolViewController: AUIDefaultSubviewViewController, AUISubcontrolViewController, AUIControlControllerTouchUpInsideDelegate, AUIControlControllerEditingChangedDelegate, AUIControlControllerValueChangedDelegate {
  
  // MARK: Delegates
  
  open weak var subcontrolControllerTouchUpInsideEventDelegate: AUIControlControllerTouchUpInsideDelegate?
  open weak var subcontrolControllerEditingChangedEventDelegate: AUIControlControllerEditingChangedDelegate?
  open weak var subcontrolControllerValueChangedEventDelegate: AUIControlControllerValueChangedDelegate?
  
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
    subcontrolController?.touchUpInsideEventDelegate = self
    subcontrolController?.editingChangedEventDelegate = self
    subcontrolController?.valueChangedEventDelegate = self
  }
  
  open override func unsetupSubviewController() {
    super.unsetupSubviewController()
    unsetupSubcontrolController()
  }
  
  open func unsetupSubcontrolController() {
    subcontrolController?.touchUpInsideEventDelegate = nil
    subcontrolController?.editingChangedEventDelegate = nil
    subcontrolController?.valueChangedEventDelegate = nil
  }
  
  // MARK: Events
  
  open func controlControllerTouchUpInside(_ controlController: AUIControlController) {
    subcontrolControllerTouchUpInsideEventDelegate?.controlControllerTouchUpInside(controlController)
  }
  
  open func controlControllerEditingChanged(_ controlController: AUIControlController) {
    subcontrolControllerEditingChangedEventDelegate?.controlControllerEditingChanged(controlController)
  }
  
  open func controlControllerValueChanged(_ controlController: AUIControlController) {
    subcontrolControllerValueChangedEventDelegate?.controlControllerValueChanged(controlController)
  }
  
}
