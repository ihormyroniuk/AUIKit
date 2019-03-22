//
//  AUISwitchController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 3/22/19.
//

import Foundation

public protocol AUISwitchController: AUIControlController {

  // MARK: Button
  
  var `switch`: UISwitch? { get set }
  
  // MARK: State
  
  var state: Bool { get set }
  
}
