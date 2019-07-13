//
//  AUIDefaultTitlePickerComponentController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

open class AUIDefaultTitlePickerComponentController: AUITitlePickerComponentController {
  
  // MARK: Items Controllers
  
  open var itemControllers: [AUIPickerItemController] {
    return titleItemControllers
  }
  open var titleItemControllers: [AUITitlePickerItemController] = []
  
  // MARK: Initializer
  
  public init() {
    setup()
  }
  
  // MARK: Setup
  
  open func setup() {
    
  }
  
}
