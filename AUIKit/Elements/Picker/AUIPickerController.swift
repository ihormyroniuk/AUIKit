//
//  AUIPickerController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUIPickerControllerDidSelectItemControllerDelegate {
  func pickerController(_ pickerController: AUIPickerController, didSelect itemController: AUIPickerItemController)
}

public protocol AUIPickerController: AUIViewController {
  
  // MARK: Picker View
  
  var pickerView: UIPickerView? { get set }
  
  // MARK: Select
  
  func select(_ itemController: AUIPickerItemController, animated: Bool)
  
}
