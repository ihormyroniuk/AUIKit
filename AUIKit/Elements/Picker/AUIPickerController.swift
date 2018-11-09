//
//  AUIPickerController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUIPickerController: AUIViewController {
  
  // MARK: Picker View
  
  var pickerView: UIPickerView? { get set }
  
  // MARK: Select
  
  func select(_ itemController: AUIPickerItemController)
  func selectAnimated(_ itemController: AUIPickerItemController)
  
}
