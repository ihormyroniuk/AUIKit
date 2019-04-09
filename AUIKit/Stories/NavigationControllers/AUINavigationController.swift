//
//  AUINavigationController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 4/9/19.
//

import Foundation

open class AUINavigationController: UINavigationController {
  
  // MARK: Initializer
  
  public init() {
    super.init(nibName: nil, bundle: nil)
    setup()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  func setup() {
    
  }
  
}
