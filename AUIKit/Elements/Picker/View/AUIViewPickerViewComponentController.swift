//
//  AUIViewPickerComponentController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/22/19.
//

import Foundation

public protocol AUIViewPickerViewComponentController: AUIPickerViewComponentController {
  
    // MARK: Items Controllers
  
    var viewItemControllers: [AUIViewPickerViewItemController] { get }
    
    var width: CGFloat { get }
    
    var height: CGFloat { get }
}
