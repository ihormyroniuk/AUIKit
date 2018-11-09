//
//  AUIPickerItemController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

public protocol AUIPickerItemControllerDidSelectDelegate: class {
  func didSelectPickerItemController(_ itemController: AUIPickerItemController)
}

public protocol AUIPickerItemController: class {
  var didSelectDelegate: AUIPickerItemControllerDidSelectDelegate? { get set }
  func didSelect()
}
