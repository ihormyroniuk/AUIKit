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
  
  var didTouchDownDelegate: AUIControlControllerDidTouchDownDelegate? { get set }
  var didTouchUpInsideDelegate: AUIControlControllerDidTouchUpInsideDelegate? { get set }
  var didTouchUpOutsideDelegate: AUIControlControllerDidTouchUpOutsideDelegate? { get set }
  var didValueChangedDelegate: AUIControlControllerDidValueChangedDelegate? { get set }
  var didEditingChangedDelegate: AUIControlControllerDidEditingChangedDelegate? { get set }
  
  // MARK: Control
  
  var control: UIControl? { get set }
  
  // MARK: Enabled
  
  var isEnabled: Bool { get set }
  
}
