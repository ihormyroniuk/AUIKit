//
//  AUIElementTableViewCellController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/1/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIClosuresTableViewCellController: AUITableViewCellController {
  
    // MARK: Initializer
  
    public init() {
        
    }
  
    // MARK: TableViewCellController
    
    open var cellForRowAtIndexPathClosure: ((IndexPath) -> UITableViewCell)?
    open func cellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = cellForRowAtIndexPathClosure?(indexPath)
        return cell ?? UITableViewCell()
    }
  
    open var estimatedHeightClosure: (() -> CGFloat)?
    open var estimatedHeight: CGFloat {
        return estimatedHeightClosure?() ?? 0
    }
  
    open var heightClosure: (() -> CGFloat)?
    open var height: CGFloat {
        return heightClosure?() ?? 0
    }
  
    open var willDisplayCellClosure: (() -> Void)?
    open func willDisplayCell() {
        willDisplayCellClosure?()
    }
    
    open var didSelectClosure: (() -> Void)?
    open func didSelectCell() {
        didSelectClosure?()
    }
    
    open var didEndDisplayingCellClosure: (() -> Void)?
    open func didEndDisplayingCell() {
        didEndDisplayingCellClosure?()
    }
  
}
