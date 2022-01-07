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
    
    @available(*, unavailable)
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: Setup
    
    open func setup() {
        
    }
    
}
