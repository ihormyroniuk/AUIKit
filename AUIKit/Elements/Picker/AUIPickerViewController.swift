//
//  AUIPickerController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUIPickerViewControllerDidSelectItemControllerObserver: AnyObject {
  func pickerViewController(_ pickerViewController: AUIPickerViewController, didSelectItemController itemController: AUIPickerViewItemController, atComponentController componentController: AUIPickerViewComponentController)
}

public protocol AUIPickerViewController: AUIViewController {

    // MARK: Components
  
    var componentControllers: [AUIPickerViewComponentController] { get }
  
    // MARK: Observers
  
    func addDidSelectItemControllerObserver(_ observer: AUIPickerViewControllerDidSelectItemControllerObserver)
    func removeDidSelectItemControllerObserver(_ observer: AUIPickerViewControllerDidSelectItemControllerObserver)
  
    // MARK: Select
  
    func selectItemController(_ itemController: AUIPickerViewItemController, atComponentController componentController: AUIPickerViewComponentController, animated: Bool)
  
    func selectedItemController(atComponentController componentController: AUIPickerViewComponentController) -> AUIPickerViewItemController?
  
    // MARK: UIPickerView
  
    var pickerView: UIPickerView? { get set }
    
}
