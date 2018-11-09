//
//  BarItemController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/8/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

public protocol AUIBarItemController {
  
  // MARK: Bar Item
  
  var barItem: UIBarItem? { get set }
  
  // MARK: Title
  
  var title: String? { get set }
  
  // MARK: Enabled
  
  var isEnabled: Bool { get set }
  
}
