//
//  AUIPickerController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUIPickerViewController: AUIViewController {

    // MARK: Components
  
    var componentControllers: [AUIPickerViewComponentController] { get }
  
    // MARK: Select
  
    func selectItemController(_ itemController: AUIPickerViewItemController, atComponentController componentController: AUIPickerViewComponentController, animated: Bool)
  
    func selectedItemController(atComponentController componentController: AUIPickerViewComponentController) -> AUIPickerViewItemController?
  
    // MARK: UIPickerView
  
    var pickerView: UIPickerView? { get set }
    
}
