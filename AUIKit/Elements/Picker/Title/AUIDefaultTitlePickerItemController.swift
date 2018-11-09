//
//  AUIDefaultTitlePickerItemController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

open class AUIDefaultTitlePickerItemController: AUITitlePickerItemController {
  open func didSelect() {
    didSelectDelegate?.didSelectPickerItemController(self)
  }
  
  open weak var didSelectDelegate: AUIPickerItemControllerDidSelectDelegate?
  
  open var title: String?
  
  open var attributedTitle: NSAttributedString?
  
  // MARK: Initializer
  
  public init() {
    setup()
  }
  
  // MARK: Setup
  
  open func setup() {
    
  }
  
}
