//
//  AUINavigationBarHiddenNavigationController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 29.01.2022.
//

import UIKit

open class AUINavigationBarHiddenNavigationController: AUINavigationController {
    
    // MARK: Setup
    
    open override func setup() {
        super.setup()
        setNavigationBarHidden(true, animated: false)
    }
    
}
