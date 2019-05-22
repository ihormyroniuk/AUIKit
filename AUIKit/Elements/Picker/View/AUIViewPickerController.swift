//
//  AUIViewPickerController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/22/19.
//

import Foundation

public protocol AUIViewPickerController: AUIPickerController {
  
  // MARK: Component Controllers
  
  var viewComponentControllers: [AUIViewPickerComponentController] { set get }
}
