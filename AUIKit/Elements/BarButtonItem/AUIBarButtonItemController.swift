//
//  AUIBarButtonItemController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/8/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

public protocol AUIBarButtonItemControllerDidSelectDelegate: class {
  func barButtonItemControllerDidSelect(_ barButtonItemController: AUIBarButtonItemController)
}

public protocol AUIBarButtonItemController: AUIBarItemController {
  
  // MARK: Bar Button Item
  
  var barButtonItem: UIBarButtonItem? { get set }
  
  // MARK: Tap
  
  var didSelectDelegate: AUIBarButtonItemControllerDidSelectDelegate? { get set }
  
}
