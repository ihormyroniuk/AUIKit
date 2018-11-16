//
//  AUIElementControlController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/2/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUIControlControllerTouchUpInsideDelegate: class {
  func controlControllerTouchUpInside(_ controller: AUIControlController)
}

public protocol AUIControlControllerEditingChangedDelegate: class {
  func controlControllerEditingChanged(_ controller: AUIControlController)
}

public protocol AUIControlControllerValueChangedDelegate: class {
  func controlControllerValueChanged(_ controller: AUIControlController)
}

public protocol AUIControlController: AUIViewController {
  
  // MARK: Delegates
  
  var touchUpInsideEventDelegate: AUIControlControllerTouchUpInsideDelegate? { get set }
  var editingChangedEventDelegate: AUIControlControllerEditingChangedDelegate? { get set }
  var valueChangedEventDelegate: AUIControlControllerValueChangedDelegate? { get set }
  
  // MARK: View
  
  var control: UIControl? { get set }
  
  var isEnabled: Bool { get set }
  
}
