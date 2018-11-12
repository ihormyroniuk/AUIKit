//
//  AUISingleSectionTableViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 10/29/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

class AUISingleSectionTableViewController: AUIDefaultTableViewController {
  
  override func setup() {
    super.setup()
    sectionControllers = [AUITableViewSectionController()]
  }
  
  var cellControllers: [AUITableViewCellController] {
    get { return sectionControllers.first?.cellControllers ?? [] }
    set { sectionControllers.first?.cellControllers = newValue }
  }
  
}
