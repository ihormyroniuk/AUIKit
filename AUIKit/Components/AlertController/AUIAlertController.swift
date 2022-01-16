//
//  AUIAlertController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 03.01.2022.
//

import UIKit

open class AUIAlertController: UIAlertController {
  
    // MARK: Initializers
  
    public init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
  
    @available(*, unavailable)
    public convenience required init?(coder aDecoder: NSCoder) {
        return nil
    }
  
    // MARK: Setup
  
    open func setup() {
    
    }
    
}
