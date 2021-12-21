//
//  AUIDefaultViewPickerItemController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/22/19.
//

import UIKit

open class AUIEmptyViewPickerViewItemController: AUIViewPickerViewItemController {
  
    // MARK: View
  
    open func view(reusingView view: UIView?) -> UIView {
        return view ?? UIView()
    }
  
    // MARK: Initializer
  
    public init() {
        setup()
    }
  
    // MARK: Setup
  
    open func setup() {
    
    }
  
}

open class AUILazyViewPickerViewItemController: AUIEmptyViewPickerViewItemController {
    
    // MARK: Initializer
  
    public override init() {
        super.init()
    }
    
    open var lazyView: ((UIView?) -> UIView)?
    open override func view(reusingView view: UIView?) -> UIView {
        return lazyView?(view) ?? UIView()
    }
  
}
