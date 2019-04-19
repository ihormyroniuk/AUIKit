//
//  AUITitlePickerController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

public protocol AUITitlePickerControllerDidSelectDelegate: class {
  func titlePickerControllerDidSelect(component: AUITitlePickerComponentController, item: AUITitlePickerItemController)
}

public protocol AUITitlePickerController: AUIPickerController {
  
  var didSelectDelegate: AUITitlePickerControllerDidSelectDelegate? { set get }
  var components: [AUITitlePickerComponentController] { set get }
  
  func getSelectedItem(for component: AUITitlePickerComponentController) -> AUITitlePickerItemController?
}
