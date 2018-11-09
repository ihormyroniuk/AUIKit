//
//  AUIDefaultTitlePickerComponentController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

open class AUIDefaultTitlePickerComponentController: AUITitlePickerComponentController {
  
  // MARK: Controllers
  
  open var items: [AUITitlePickerItemController] = []
  
  // MARK: Initializer
  
  public init() {
    setup()
  }
  
  // MARK: Setup
  
  open func setup() {
    
  }
  
  // MARK: Select
  
  open func didSelectItemAtIndex(_ index: Int) {
    items[index].didSelect()
  }
}
