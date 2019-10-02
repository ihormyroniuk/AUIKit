//
//  AUIDefaultPresentation.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/26/19.
//

import UIKit

open class AUIWindowPresentation: AUIPresentation {
  
  // MARK: Elements
  
  public let window: UIWindow
  
  // MARK: Initializer
  
  public init(window: UIWindow) {
    self.window = window
    setup()
  }
  
  // MARK: Setup
  
  open func setup() {
    
  }
  
}
