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
  
    open var itemControllers: [AUIPickerViewItemController] {
        return viewItemControllers
    }
    open var viewItemControllers: [AUIViewPickerViewItemController] = []
  
    open var width: CGFloat {
        return 0
    }
    
    open var height: CGFloat {
        return 0
    }
  
}

open class AUILazyViewPickerViewComponentController: AUIEmptyViewPickerViewComponentController {
    
    open var lazyWidth: (() -> CGFloat)?
    open override var width: CGFloat {
        return lazyWidth?() ?? 0
    }
    
    open var lazyHeight: (() -> CGFloat)?
    open override var height: CGFloat {
        return lazyHeight?() ?? 0
    }
  
}
