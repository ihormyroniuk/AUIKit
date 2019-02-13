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

  open weak var touchUpInsideEventDelegate: AUIControlControllerTouchUpInsideDelegate?
  open weak var editingChangedEventDelegate: AUIControlControllerEditingChangedDelegate?
  open weak var valueChangedEventDelegate: AUIControlControllerValueChangedDelegate?
  
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
    control?.addTarget(self, action: #selector(editingChangedEventAction), for: .editingChanged)
    control?.addTarget(self, action: #selector(valueChangedEventAction), for: .valueChanged)
  }
  
  open override func unsetupView() {
    super.unsetupView()
    unsetupControl()
  }
  
  open func unsetupControl() {
    control?.removeTarget(self, action: #selector(touchUpInsideEventAction), for: .touchUpInside)
    control?.removeTarget(self, action: #selector(editingChangedEventAction), for: .editingChanged)
    control?.removeTarget(self, action: #selector(valueChangedEventAction), for: .valueChanged)
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
  
  @objc open func touchUpInsideEventAction() {
    touchUpInsideEventDelegate?.controlControllerTouchUpInside(self)
  }
  
  @objc open func editingChangedEventAction() {
    editingChangedEventDelegate?.controlControllerEditingChanged(self)
  }
  
  @objc open func valueChangedEventAction() {
    valueChangedEventDelegate?.controlControllerValueChanged(self)
  }
  
}
