//
//  AUDefaultSegmentedControlController.swift
//  TOPLYVO UA
//
//  Created by Ihor Myroniuk on 2/20/19.
//  Copyright © 2019 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultSegmentedControlController: AUIDefaultControlController, AUISegmentedControlController {
    
    // MARK: Items
    
  open var itemControllers: [AUISegmentedControlItemController] = [] {
    didSet {
            
    }
  }
  
  open var selectedItemController: AUISegmentedControlItemController?
  
  public override init() {
    
  }
  
  // MARK: SegmentedControl
    
  open var segmentedControl: UISegmentedControl? {
    set {
      view = newValue
    }
    get {
      return view as? UISegmentedControl
    }
  }
    
  open override func setupControl() {
    super.setupControl()
    setupSegmentedControl()
  }
    
  open func setupSegmentedControl() {
    segmentedControl?.removeAllSegments()
    var index = 0
    for itemController in itemControllers {
      if let title = itemController.title {
        segmentedControl?.insertSegment(withTitle: title, at: index, animated: false)
      }
      if itemController === selectedItemController {
        segmentedControl?.selectedSegmentIndex = index
      }
      index += 1
    }
  }
    
  open override func valueChangedEventAction() {
    if let selectedSegmentIndex = segmentedControl?.selectedSegmentIndex {
      let selectedItemController = itemControllers[selectedSegmentIndex]
      self.selectedItemController = selectedItemController
      selectedItemController.didSelect()
    }
    super.valueChangedEventAction()
  }
    
}
