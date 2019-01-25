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
  
  // MARK: Subcontrol
  
  open var subcontrolController: AUIControlController? {
    set { subviewController = newValue }
    get { return subviewController as? AUIControlController }
  }
  
  open override func setupSubviewController() {
    super.setupSubviewController()
    subcontrolController?.touchUpInsideEventDelegate = self
    subcontrolController?.editingChangedEventDelegate = self
    subcontrolController?.valueChangedEventDelegate = self
  }
  
  open override func unsetupSubviewController() {
    super.unsetupSubviewController()
    subcontrolController?.touchUpInsideEventDelegate = nil
    subcontrolController?.editingChangedEventDelegate = nil
    subcontrolController?.valueChangedEventDelegate = nil
  }
  
  // MARK: Events
  
  open func controlControllerTouchUpInside(_ controller: AUIControlController) {
    subcontrolControllerTouchUpInsideEventDelegate?.controlControllerTouchUpInside(controller)
  }
  
  open func controlControllerEditingChanged(_ controller: AUIControlController) {
    subcontrolControllerEditingChangedEventDelegate?.controlControllerEditingChanged(controller)
  }
  
  open func controlControllerValueChanged(_ controller: AUIControlController) {
    subcontrolControllerValueChangedEventDelegate?.controlControllerValueChanged(controller)
  }
  
}
