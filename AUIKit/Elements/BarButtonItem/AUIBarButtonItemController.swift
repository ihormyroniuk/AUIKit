//
//  AUIBarButtonItemController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/8/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

public protocol AUIBarButtonItemControllerDidSelectObserver: class {
  func barButtonItemControllerDidSelect(_ barButtonItemController: AUIBarButtonItemController)
}

public protocol AUIBarButtonItemController: AUIBarItemController {
  
  // MARK: Observers
  
  func addDidSelectObserver(_ observer: AUIBarButtonItemControllerDidSelectObserver)
  func removeDidSelectObserver(_ observer: AUIBarButtonItemControllerDidSelectObserver)
  
  // MARK: Bar Button Item
  
  var barButtonItem: UIBarButtonItem? { get set }
  
}
