//
//  AUINavigationController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 9/22/19.
//

import UIKit

open class AUINavigationController: UINavigationController {
  
  // MARK: Initializer
  
  public init() {
    super.init(nibName: nil, bundle: nil)
    setup()
  }
  
  public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  open func setup() {
    
  }

}
