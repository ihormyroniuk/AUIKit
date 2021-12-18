//
//  AUIViewPickerItemController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 5/22/19.
//

import Foundation

public protocol AUIViewPickerViewItemController: AUIPickerViewItemController {
  
  // MARK: View
  
  func view(reusingView view: UIView?) -> UIView
  
}
