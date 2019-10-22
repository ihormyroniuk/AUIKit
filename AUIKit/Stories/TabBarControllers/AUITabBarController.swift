//
//  AUITabBarController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 4/9/19.
//

import UIKit

open class AUITabBarController: UITabBarController {
  
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
