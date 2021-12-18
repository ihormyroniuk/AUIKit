//
//  AUIDefaultViewPickerComponentController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/22/19.
//

import UIKit

open class AUIEmptyViewPickerViewComponentController: AUIViewPickerViewComponentController {
    
    // MARK: Initializer
    
    public init() {
      setup()
    }
    
    // MARK: Setup
    
    open func setup() {
      
    }
  
    public var itemControllers: [AUIPickerViewItemController] {
        return viewItemControllers
    }
    public var viewItemControllers: [AUIViewPickerViewItemController] = []
  
    public var width: CGFloat = 0
    
    public var height: CGFloat = 0
  
}
