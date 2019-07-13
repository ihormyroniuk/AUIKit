//
//  AUITitlePickerComponentController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

public protocol AUITitlePickerComponentController: AUIPickerComponentController {
  
  // MARK: Items Controllers
  
  var titleItemControllers: [AUITitlePickerItemController] { get }
}
