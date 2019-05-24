//
//  ButtonController.swift
//  agroportex-ios
//
//  Created by Ihor Myroniuk on 1/26/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultButtonController: AUIDefaultControlController, AUIButtonController {
  
  // MARK: Button
  
  open var button: UIButton? {
    set { view = newValue }
    get { return view as? UIButton }
  }
  
  open override func setupControl() {
    super.setupControl()
    setupButton()
  }
  
  open func setupButton() {
    button?.setTitle(normalTitle, for: .normal)
  }
  
  open override func unsetupControl() {
    super.unsetupControl()
    unsetupButton()
  }
  
  open func unsetupButton() {
    
  }
  
  // MARK: State
  
  open var title: String? {
    didSet { didSetTitle(oldValue: oldValue) }
  }
  open func didSetTitle(oldValue: String?) {
    normalTitle = title
  }
  
  open var normalTitle: String? {
    didSet { didSetNormalTitle(oldValue: oldValue) }
  }
  open func didSetNormalTitle(oldValue: String?) {
    button?.setTitle(title, for: .normal)
  }
  
}
