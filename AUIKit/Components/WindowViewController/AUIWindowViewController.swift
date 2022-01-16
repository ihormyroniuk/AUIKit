//
//  AUIScreenController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 11/12/18.
//

import UIKit

open class AUIWindowViewController: UIViewController {
  
    // MARK: Initializers
  
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
  
    @available(*, unavailable)
    public convenience required init?(coder aDecoder: NSCoder) {
        return nil
    }
  
    // MARK: Setup
  
    open func setup() {
    
    }
    
}
