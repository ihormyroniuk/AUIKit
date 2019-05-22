//
//  AUIViewPickerComponentController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/22/19.
//

import Foundation

public protocol AUIViewPickerComponentController: AUIPickerComponentController {
  
  // MARK: Items Controllers
  
  var viewItemControllers: [AUIViewPickerItemController] { get }
}
