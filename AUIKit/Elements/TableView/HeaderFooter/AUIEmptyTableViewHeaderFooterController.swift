//
//  AUIElementTableViewHeaderFooterController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/1/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIEmptyTableViewHeaderFooterController: AUITableViewHeaderFooterController {
  
    // MARK: Initializer
  
    public init() {
      
    }
  
    open func view() -> UITableViewHeaderFooterView? {
        return UITableViewHeaderFooterView()
    }
  
    open var estimatedHeight: CGFloat {
        return 0
    }
  
    open var height: CGFloat {
        return 0
    }
    
    public func willDisplay() {
        
    }
    
    open func didEndDisplaying() {
        
    }
  
}
