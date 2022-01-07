//
//  AUIDefaultTitlePickerComponentController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

open class AUIEmptyTitlePickerViewComponentController: AUITitlePickerViewComponentController {
  
    // MARK: Items Controllers
  
    open var itemControllers: [AUIPickerViewItemController] {
        return titleItemControllers
    }
    open var titleItemControllers: [AUITitlePickerViewItemController] = []
  
    // MARK: Initializer
  
    public init() {
        setup()
    }
  
    // MARK: Setup
    
    open func setup() {
    
    }
    
}
