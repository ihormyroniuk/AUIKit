//
//  AUIPickerComponentController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

public protocol AUIPickerViewComponentController: AnyObject {
  
    // MARK: ItemControllers
  
    var itemControllers: [AUIPickerViewItemController] { get }
    
}
