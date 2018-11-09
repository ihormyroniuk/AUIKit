//
//  AUIDefaultBarItemController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/8/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultBarItemController: AUIBarItemController {
  
  // MARK: Initializer
  
  public init() {
    setup()
  }
  
  // MARK: Setup
  
  open func setup() {
    
  }
  
  // MARK: View
  
  private var _barItem: UIBarItem?
  open var barItem: UIBarItem? {
    set {
      if newValue != _barItem {
        unsetupBarItem()
        _barItem = newValue
        setupBarItem()
      }
    }
    get {
      return _barItem
    }
  }
  
  open func setupBarItem() {
    barItem?.title = title
    barItem?.isEnabled = isEnabled
  }
  
  open func unsetupBarItem() {
    barItem?.isEnabled = isEnabled
  }
  
  // MARK: Title
  
  open var title: String? {
    didSet { didSetTitle() }
  }
  open func didSetTitle() {
    barItem?.title = title
  }
  
  // MARK: State
  
  open var isEnabled: Bool = true {
    didSet { didSetIsEnabled() }
  }
  open func didSetIsEnabled() {
    barItem?.isEnabled = isEnabled
  }
  
}
