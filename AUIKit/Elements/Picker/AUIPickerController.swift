//
//  AUIPickerController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUIPickerControllerDidSelectItemControllerDelegate {
  func pickerController(_ pickerController: AUIPickerController, didSelectItemController itemController: AUIPickerItemController)
}

public protocol AUIPickerController: AUIViewController {
  
  // MARK: Picker View
  
  var pickerView: UIPickerView? { get set }
  
  // MARK: Delegate
  
  var didSelectItemControllerDelegate: AUIPickerControllerDidSelectItemControllerDelegate { get set }
  
  // MARK: Select
  
  func select(_ itemController: AUIPickerItemController, animated: Bool)
  
}
