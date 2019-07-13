//
//  AUIViewPickerItemController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/22/19.
//

import Foundation

public protocol AUIViewPickerItemController: AUIPickerItemController {
  
  // MARK: View
  
  var view: UIView { get }
  
}
