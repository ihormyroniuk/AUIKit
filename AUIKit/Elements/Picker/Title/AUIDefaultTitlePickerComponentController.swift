//
//  AUIDefaultTitlePickerComponentController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

open class AUIDefaultTitlePickerComponentController: AUITitlePickerComponentController {
  open var items: [AUITitlePickerItemController] = []
  
  open func didSelectItemAtIndex(_ index: Int) {
    items[index].didSelect()
  }
}
