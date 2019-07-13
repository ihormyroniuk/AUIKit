//
//  AUIDefaultSwitchController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 3/22/19.
//

import Foundation

open class AUIDefaultSwitchController: AUIDefaultControlController, AUISwitchController {

  // MARK: View
  
  open var `switch`: UISwitch? {
    set { view = newValue }
    get { return view as? UISwitch }
  }
  
  open override func setupView() {
    super.setupView()
    `switch`?.setOn(state, animated: false)
  }
  
  // MARK: State
  
  open var state: Bool = false {
    didSet { didSetState(oldValue: oldValue) }
  }
  open func didSetState(oldValue: Bool?) {
    `switch`?.setOn(state, animated: true)
  }
}
