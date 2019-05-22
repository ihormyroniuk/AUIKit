//
//  AUIDefaultViewPickerComponentController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/22/19.
//

import UIKit

open class AUIDefaultViewPickerComponentController: AUIViewPickerComponentController {
  
  public var itemControllers: [AUIPickerItemController] {
    return viewItemControllers
  }
  public var viewItemControllers: [AUIViewPickerItemController] = []
  
  
}
