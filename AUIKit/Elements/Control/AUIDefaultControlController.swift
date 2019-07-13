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

  open var didTouchDownObservers = NSHashTable<AnyObject>.weakObjects()
  
  open func addDidTouchDownObserver(_ observer: AUIControlControllerDidTouchDownObserver) {
    didTouchDownObservers.add(observer)
  }
  
  open func removeDidTouchDownObserver(_ observer: AUIControlControllerDidTouchDownObserver) {
    didTouchDownObservers.remove(observer)
  }
  
  open var didTouchUpInsideObservers = NSHashTable<AnyObject>.weakObjects()
  
  open func addDidTouchUpInsideObserver(_ observer: AUIControlControllerDidTouchUpInsideObserver) {
    didTouchUpInsideObservers.add(observer)
  }
  
  open func removeDidTouchUpInsideObserver(_ observer: AUIControlControllerDidTouchUpInsideObserver) {
    didTouchUpInsideObservers.remove(observer)
  }
  
  open var didTouchUpOutsideObservers = NSHashTable<AnyObject>.weakObjects()
  
  open func addDidTouchUpOutsideObserver(_ observer: AUIControlControllerDidTouchUpOutsideObserver) {
    didTouchUpOutsideObservers.add(observer)
  }
  
  open func removeDidTouchUpOutsideObserver(_ observer: AUIControlControllerDidTouchUpOutsideObserver) {
    didTouchUpOutsideObservers.remove(observer)
  }
  
  open var didValueChangedObservers = NSHashTable<AnyObject>.weakObjects()
  
  open func addDidValueChangedObserver(_ observer: AUIControlControllerDidValueChangedObserver) {
    didValueChangedObservers.add(observer)
  }
  
  open func removeDidValueChangedObserver(_ observer: AUIControlControllerDidValueChangedObserver) {
    didValueChangedObservers.remove(observer)
  }
  
  open var didEditingChangedObservers = NSHashTable<AnyObject>.weakObjects()
  
  open func addDidEditingChangedObserver(_ observer: AUIControlControllerDidEditingChangedObserver) {
    didEditingChangedObservers.add(observer)
  }
  
  open func removeDidEditingChangedObserver(_ observer: AUIControlControllerDidEditingChangedObserver) {
    didEditingChangedObservers.remove(observer)
  }
  
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
    for object in didTouchDownObservers.allObjects {
      guard let observer = object as? AUIControlControllerDidTouchDownObserver else { continue }
      observer.controlControllerDidTouchDown(self)
    }
  }
  
  @objc open func touchUpInsideEventAction() {
    for object in didTouchUpInsideObservers.allObjects {
      guard let observer = object as? AUIControlControllerDidTouchUpInsideObserver else { continue }
      observer.controlControllerDidTouchUpInside(self)
    }
  }
  
  @objc open func touchUpOutsideEventAction() {
    for object in didTouchUpOutsideObservers.allObjects {
      guard let observer = object as? AUIControlControllerDidTouchUpOutsideObserver else { continue }
      observer.controlControllerDidTouchUpOutside(self)
    }
  }
  
  @objc open func valueChangedEventAction() {
    for object in didValueChangedObservers.allObjects {
      guard let observer = object as? AUIControlControllerDidValueChangedObserver else { continue }
      observer.controlControllerDidValueChanged(self)
    }
  }

  @objc open func editingChangedEventAction() {
    for object in didEditingChangedObservers.allObjects {
      guard let observer = object as? AUIControlControllerDidEditingChangedObserver else { continue }
      observer.controlControllerDidEditingChanged(self)
    }
  }
  
}
