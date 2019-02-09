//
//  AUIElementControlController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/2/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUIControlControllerTouchUpInsideDelegate: class {
  func controlControllerTouchUpInside(_ сontrolController: AUIControlController)
}

public protocol AUIControlControllerEditingChangedDelegate: class {
  func controlControllerEditingChanged(_ сontrolController: AUIControlController)
}

public protocol AUIControlControllerValueChangedDelegate: class {
  func controlControllerValueChanged(_ сontrolController: AUIControlController)
}

public protocol AUIControlController: AUIViewController {
  
  // MARK: Delegates
  
  var touchUpInsideEventDelegate: AUIControlControllerTouchUpInsideDelegate? { get set }
  var editingChangedEventDelegate: AUIControlControllerEditingChangedDelegate? { get set }
  var valueChangedEventDelegate: AUIControlControllerValueChangedDelegate? { get set }
  
  // MARK: Control
  
  var control: UIControl? { get set }
  
  // MARK: Enabled
  
  var isEnabled: Bool { get set }
  
}
