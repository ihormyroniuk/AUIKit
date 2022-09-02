//
//  AUIEmptyPageController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 26.12.2021.
//

import UIKit

open class AUIEmptyPageController: AUIPageController {
  
    public init() {
        
    }
    
    public var viewController: UIViewController {
        return UIViewController()
    }
    
    open func willDisplayPage() {
        
    }
    
    open func didDisplayPage() {

    }
    
}
