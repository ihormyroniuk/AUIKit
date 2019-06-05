//
//  AUIPickerController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUIPickerControllerDidSelectItemControllerObserver: class {
  func pickerController(_ pickerController: AUIPickerController, didSelectItemController itemController: AUIPickerItemController, atComponentController componentController: AUIPickerComponentController)
}

public protocol AUIPickerController: AUIViewController {

  // MARK: Components
  
  var componentControllers: [AUIPickerComponentController] { get }
  
  // MARK: Observers
  
  func addDidSelectItemControllerObserver(_ observer: AUIPickerControllerDidSelectItemControllerObserver)
  func removeDidSelectItemControllerObserver(_ observer: AUIPickerControllerDidSelectItemControllerObserver)
  
  // MARK: Select
  
  func selectItemController(_ itemController: AUIPickerItemController, atComponentController componentController: AUIPickerComponentController, animated: Bool)
  
  func selectedItemController(atComponentController componentController: AUIPickerComponentController) -> AUIPickerItemController?
  
  // MARK: UIPickerView
  
  var pickerView: UIPickerView? { get set }
  
}
