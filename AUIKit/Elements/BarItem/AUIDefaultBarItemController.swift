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
    barItem?.image = image
    barItem?.landscapeImagePhone = landscapeImagePhone
    if #available(iOS 11.0, *) { barItem?.largeContentSizeImage = largeContentSizeImage }
    barItem?.isEnabled = isEnabled
  }
  
  open func unsetupBarItem() {
    
  }
  
  // MARK: Title
  
  open var title: String? {
    didSet { didSetTitle(oldValue: oldValue) }
  }
  open func didSetTitle(oldValue: String?) {
    barItem?.title = title
  }
  
  // MARK: Image
  
  open var image: UIImage? {
    didSet { didSetImage(oldValue: oldValue) }
  }
  open func didSetImage(oldValue: UIImage?) {
    barItem?.image = image
  }
  
  open var landscapeImagePhone: UIImage? {
    didSet { didSetLandscapeImagePhone(oldValue: oldValue) }
  }
  open func didSetLandscapeImagePhone(oldValue: UIImage?) {
    barItem?.landscapeImagePhone = landscapeImagePhone
  }
  
  open var largeContentSizeImage: UIImage? {
    didSet { if #available(iOS 11.0, *) { didSetLargeContentSizeImage(oldValue: oldValue) } }
  }
  @available(iOS 11.0, *)
  open func didSetLargeContentSizeImage(oldValue: UIImage?) {
    barItem?.largeContentSizeImage = largeContentSizeImage
  }
  
  // MARK: State
  
  open var isEnabled: Bool = true {
    didSet { didSetIsEnabled() }
  }
  open func didSetIsEnabled() {
    barItem?.isEnabled = isEnabled
  }
  
}
