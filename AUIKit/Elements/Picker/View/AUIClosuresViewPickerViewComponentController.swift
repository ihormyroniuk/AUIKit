//
//  AUIClosuresViewPickerViewComponentController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 23.12.2021.
//

import Foundation

open class AUIClosuresViewPickerViewComponentController: AUIEmptyViewPickerViewComponentController {
    
    open var lazyWidth: (() -> CGFloat)?
    open override var width: CGFloat {
        return lazyWidth?() ?? 0
    }
    
    open var lazyHeight: (() -> CGFloat)?
    open override var height: CGFloat {
        return lazyHeight?() ?? 0
    }
  
}
