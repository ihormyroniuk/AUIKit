//
//  AUIPickerController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUIPickerControllerDidSelectItemControllerDelegate: class {
  func pickerController(_ pickerController: AUIPickerController, didSelectItemController itemController: AUIPickerItemController, atComponentController componentController: AUIPickerComponentController)
}

public protocol AUIPickerController: AUIViewController {

  // MARK: UIPickerView
  
  var pickerView: UIPickerView? { get set }
  
  // MARK: Components
  
  var componentControllers: [AUIPickerComponentController] { get }
  
  // MARK: Delegate
  
  var didSelectItemControllerDelegate: AUIPickerControllerDidSelectItemControllerDelegate? { get set }
  
  // MARK: Select
  
  func selectItemController(_ itemController: AUIPickerItemController, atComponentController componentController: AUIPickerComponentController, animated: Bool)
  
  func selectedItemController(atComponentController componentController: AUIPickerComponentController) -> AUIPickerItemController?
  
}
