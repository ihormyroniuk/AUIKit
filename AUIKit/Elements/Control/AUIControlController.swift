//
//  AUIElementControlController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/2/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUIControlControllerDidTouchDownDelegate: class {
  func controlControllerDidTouchDown(_ controlController: AUIControlController)
}

public protocol AUIControlControllerDidTouchUpInsideDelegate: class {
  func controlControllerDidTouchUpInside(_ controlController: AUIControlController)
}

public protocol AUIControlControllerDidTouchUpOutsideDelegate: class {
  func controlControllerDidTouchUpOutside(_ controlController: AUIControlController)
}

public protocol AUIControlControllerDidEditingChangedDelegate: class {
  func controlControllerDidEditingChanged(_ сontrolController: AUIControlController)
}

public protocol AUIControlControllerDidValueChangedDelegate: class {
  func controlControllerDidValueChanged(_ сontrolController: AUIControlController)
}

public protocol AUIControlController: AUIViewController {
  
  // MARK: Delegates
  
  func addDidTouchDownObserver(_ observer: AUIControlControllerDidTouchDownDelegate)
  func removeDidTouchDownObserver(_ observer: AUIControlControllerDidTouchDownDelegate)
  
  func addDidTouchUpInsideObserver(_ observer: AUIControlControllerDidTouchUpInsideDelegate)
  func removeDidTouchUpInsideObserver(_ observer: AUIControlControllerDidTouchUpInsideDelegate)
  
  func addDidTouchUpOutsideObserver(_ observer: AUIControlControllerDidTouchUpOutsideDelegate)
  func removeDidTouchUpOutsideObserver(_ observer: AUIControlControllerDidTouchUpOutsideDelegate)
  
  func addDidValueChangedObserver(_ observer: AUIControlControllerDidValueChangedDelegate)
  func removeDidValueChangedObserver(_ observer: AUIControlControllerDidValueChangedDelegate)
  
  func addDidEditingChangedObserver(_ observer: AUIControlControllerDidEditingChangedDelegate)
  func removeDidEditingChangedObserver(_ observer: AUIControlControllerDidEditingChangedDelegate)
  
  // MARK: Control
  
  var control: UIControl? { get set }
  
  // MARK: Enabled
  
  var isEnabled: Bool { get set }
  
}
