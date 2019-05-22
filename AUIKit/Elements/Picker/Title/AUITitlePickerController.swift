//
//  AUITitlePickerController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

public protocol AUITitlePickerController: AUIPickerController {
  
  // MARK: Component Controllers
  
  var titleComponentControllers: [AUITitlePickerComponentController] { set get }
}
