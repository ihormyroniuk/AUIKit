//
//  AUIElementControlController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/2/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol ControlControllerTouchUpInsideDelegate: class {
  func controlControllerTouchUpInside(_ controller: AUIControlController)
}

public protocol ControlControllerEditingChangedDelegate: class {
  func controlControllerEditingChanged(_ controller: AUIControlController)
}

public protocol ControlControllerValueChangedDelegate: class {
  func controlControllerValueChanged(_ controller: AUIControlController)
}

public protocol AUIControlController: AUIViewController {
  
  // MARK: Delegates
  
  var touchUpInsideEventDelegate: ControlControllerTouchUpInsideDelegate? { get set }
  var editingChangedDelegate: ControlControllerEditingChangedDelegate? { get set }
  var valueChangedDelegate: ControlControllerValueChangedDelegate? { get set }
  
  // MARK: View
  
  var control: UIControl? { get set }
  
  var isEnabled: Bool { get set }
  
}
