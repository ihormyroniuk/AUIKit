//
//  AUIClosuresViewPickerViewComponentController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 23.12.2021.
//

import Foundation

open class AUIClosuresViewPickerViewComponentController: AUIEmptyViewPickerViewComponentController {
    
    open var widthClosure: (() -> CGFloat)?
    open override var width: CGFloat {
        return widthClosure?() ?? 0
    }
    
    open var heightClosure: (() -> CGFloat)?
    open override var height: CGFloat {
        return heightClosure?() ?? 0
    }
  
}
