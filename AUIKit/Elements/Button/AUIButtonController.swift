//
//  AUIElementButtonController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/2/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

public protocol AUIButtonController: AUIControlController {
  
  // MARK: Button
  
  var button: UIButton? { get set }
  
  // MARK: Title
  
  var title: String? { get set }
  var normalTitle: String? { get set }
  
}
