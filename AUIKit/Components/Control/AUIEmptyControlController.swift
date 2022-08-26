//
//  ControlController.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/14/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIEmptyControlController: AUIEmptyViewController, AUIControlController {
    
    // MARK: - Actions
    
    open var touchDown: (() -> Void)?
    
    open var touchUpInside: (() -> Void)?
    
    open var touchUpOutside: (() -> Void)?
    
    open var valueChanged: (() -> Void)?
    
    open var editingChanged: (() -> Void)?
  
    // MARK: - Control
  
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
        control?.addTarget(self, action: #selector(touchDownEventAction), for: .touchDown)
        control?.addTarget(self, action: #selector(touchUpInsideEventAction), for: .touchUpInside)
        control?.addTarget(self, action: #selector(touchUpOutsideEventAction), for: .touchUpOutside)
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
        control?.removeTarget(self, action: #selector(touchUpOutsideEventAction), for: .touchUpOutside)
        control?.removeTarget(self, action: #selector(valueChangedEventAction), for: .valueChanged)
        control?.removeTarget(self, action: #selector(editingChangedEventAction), for: .editingChanged)
    }
  
    // MARK: - State
  
    open var isEnabled: Bool = true {
        didSet {
            didSetIsEnabled(oldValue: oldValue)
        }
    }
    open func didSetIsEnabled(oldValue: Bool) {
        control?.isEnabled = isEnabled
    }
  
    // MARK: - Events
  
    @objc open func touchDownEventAction() {
        guard let touchDown = touchDown else { return }
        touchDown()
    }
  
    @objc open func touchUpInsideEventAction() {
        guard let touchUpInside = touchUpInside else { return }
        touchUpInside()
    }
  
    @objc open func touchUpOutsideEventAction() {
        guard let touchUpOutside = touchUpOutside else { return }
        touchUpOutside()
    }
  
    @objc open func valueChangedEventAction() {
        guard let valueChanged = valueChanged else { return }
        valueChanged()
    }

    @objc open func editingChangedEventAction() {
        guard let editingChanged = editingChanged else { return }
        editingChanged()
    }
  
}
