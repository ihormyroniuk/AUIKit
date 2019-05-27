//
//  AUIElementControlController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/2/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUIControlControllerDidTouchDownObserver: class {
  func controlControllerDidTouchDown(_ controlController: AUIControlController)
}

public protocol AUIControlControllerDidTouchUpInsideObserver: class {
  func controlControllerDidTouchUpInside(_ controlController: AUIControlController)
}

public protocol AUIControlControllerDidTouchUpOutsideObserver: class {
  func controlControllerDidTouchUpOutside(_ controlController: AUIControlController)
}

public protocol AUIControlControllerDidEditingChangedObserver: class {
  func controlControllerDidEditingChanged(_ сontrolController: AUIControlController)
}

public protocol AUIControlControllerDidValueChangedObserver: class {
  func controlControllerDidValueChanged(_ сontrolController: AUIControlController)
}

public protocol AUIControlController: AUIViewController {
  
  // MARK: Observers
  
  func addDidTouchDownObserver(_ observer: AUIControlControllerDidTouchDownObserver)
  func removeDidTouchDownObserver(_ observer: AUIControlControllerDidTouchDownObserver)
  
  func addDidTouchUpInsideObserver(_ observer: AUIControlControllerDidTouchUpInsideObserver)
  func removeDidTouchUpInsideObserver(_ observer: AUIControlControllerDidTouchUpInsideObserver)
  
  func addDidTouchUpOutsideObserver(_ observer: AUIControlControllerDidTouchUpOutsideObserver)
  func removeDidTouchUpOutsideObserver(_ observer: AUIControlControllerDidTouchUpOutsideObserver)
  
  func addDidValueChangedObserver(_ observer: AUIControlControllerDidValueChangedObserver)
  func removeDidValueChangedObserver(_ observer: AUIControlControllerDidValueChangedObserver)
  
  func addDidEditingChangedObserver(_ observer: AUIControlControllerDidEditingChangedObserver)
  func removeDidEditingChangedObserver(_ observer: AUIControlControllerDidEditingChangedObserver)
  
  // MARK: Control
  
  var control: UIControl? { get set }
  
  // MARK: Enabled
  
  var isEnabled: Bool { get set }
  
}
