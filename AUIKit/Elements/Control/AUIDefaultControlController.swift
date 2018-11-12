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

  open weak var touchUpInsideEventDelegate: ControlControllerTouchUpInsideDelegate?
  open weak var editingChangedDelegate: ControlControllerEditingChangedDelegate?
  open weak var valueChangedDelegate: ControlControllerValueChangedDelegate?
  
  // MARK: View
  
  open var control: UIControl? {
    set { view = newValue }
    get { return view as? UIControl }
  }
  
  open override func setupView() {
    super.setupView()
    control?.isEnabled = isEnabled
    control?.addTarget(self, action: #selector(touchUpInsideAction), for: .touchUpInside)
    control?.addTarget(self, action: #selector(editingChangedAction), for: .editingChanged)
    control?.addTarget(self, action: #selector(valueChangedAction), for: .valueChanged)
  }
  
  open override func unsetupView() {
    super.unsetupView()
    control?.removeTarget(self, action: #selector(touchUpInsideAction), for: .touchUpInside)
    control?.removeTarget(self, action: #selector(editingChangedAction), for: .editingChanged)
    control?.removeTarget(self, action: #selector(valueChangedAction), for: .valueChanged)
  }
  
  // MARK: State
  
  open var isEnabled: Bool = true {
    didSet { didSetIsEnabled() }
  }
  open func didSetIsEnabled() {
    control?.isEnabled = isEnabled
  }
  
  // MARK: - Events -
  
  
  @objc open func touchUpInsideAction() {
    touchUpInsideEventDelegate?.controlControllerTouchUpInside(self)
  }
  
  @objc open func editingChangedAction() {
    editingChangedDelegate?.controlControllerEditingChanged(self)
  }
  
  @objc open func valueChangedAction() {
    valueChangedDelegate?.controlControllerValueChanged(self)
  }
  
}
