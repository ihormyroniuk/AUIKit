//
//  ControlController.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/14/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultControlController: AUIDefaultViewController, AUIControlController {
  
  // MARK: Delegates
  
  open weak var didTouchDownDelegate: AUIControlControllerDidTouchDownDelegate?
  open weak var didTouchUpInsideDelegate: AUIControlControllerDidTouchUpInsideDelegate?
  open weak var didTouchUpOutsideDelegate: AUIControlControllerDidTouchUpOutsideDelegate?
  open weak var didValueChangedDelegate: AUIControlControllerDidValueChangedDelegate?
  open weak var didEditingChangedDelegate: AUIControlControllerDidEditingChangedDelegate?
  
  // MARK: Control
  
  open var control: UIControl? {
    set {
      view = newValue
    }
    get {
      return view as? UIControl
    }
  }
  
  open override func setupView() {
    super.setupView()
    setupControl()
  }
  
  open func setupControl() {
    control?.isEnabled = isEnabled
    control?.addTarget(self, action: #selector(touchUpInsideEventAction), for: .touchUpInside)
    control?.addTarget(self, action: #selector(touchUpOutsideEventAction), for: .touchUpOutside)
    control?.addTarget(self, action: #selector(touchDownEventAction), for: .touchDown)
    control?.addTarget(self, action: #selector(valueChangedEventAction), for: .valueChanged)
    control?.addTarget(self, action: #selector(editingChangedEventAction), for: .editingChanged)
  }
  
  open override func unsetupView() {
    super.unsetupView()
    unsetupControl()
  }
  
  open func unsetupControl() {
    control?.removeTarget(self, action: #selector(touchDownEventAction), for: .touchDown)
    control?.removeTarget(self, action: #selector(touchUpInsideEventAction), for: .touchUpInside)
    control?.removeTarget(self, action: #selector(touchUpInsideEventAction), for: .touchUpOutside)
    control?.removeTarget(self, action: #selector(valueChangedEventAction), for: .valueChanged)
    control?.removeTarget(self, action: #selector(editingChangedEventAction), for: .editingChanged)
  }
  
  // MARK: State
  
  open var isEnabled: Bool = true {
    didSet {
      didSetIsEnabled(oldValue: oldValue)
    }
  }
  open func didSetIsEnabled(oldValue: Bool) {
    control?.isEnabled = isEnabled
  }
  
  // MARK: Events
  
  @objc open func touchDownEventAction() {
    didTouchDownDelegate?.controlControllerDidTouchDown(self)
  }
  
  @objc open func touchUpInsideEventAction() {
    didTouchUpInsideDelegate?.controlControllerDidTouchUpInside(self)
  }
  
  @objc open func touchUpOutsideEventAction() {
    didTouchUpOutsideDelegate?.controlControllerDidTouchUpOutside(self)
  }
  
  @objc open func valueChangedEventAction() {
    didValueChangedDelegate?.controlControllerDidValueChanged(self)
  }
  
  @objc open func editingChangedEventAction() {
    didEditingChangedDelegate?.controlControllerDidEditingChanged(self)
  }
  
}
