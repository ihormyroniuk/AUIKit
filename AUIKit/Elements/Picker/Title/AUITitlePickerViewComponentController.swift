//
//  AUITitlePickerComponentController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

public protocol AUITitlePickerViewComponentController: AUIPickerViewComponentController {
  
    // MARK: Items Controllers
  
    var titleItemControllers: [AUITitlePickerViewItemController] { get }
    
}
