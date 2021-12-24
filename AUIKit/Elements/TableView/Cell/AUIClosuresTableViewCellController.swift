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
  
    open var didSelectClosure: (() -> Void)?
    open func didSelectCell() {
        didSelectClosure?()
    }
  
    // MARK: TableViewCellController
    
    public var cellForRowAtIndexPathClosure: ((UITableView, IndexPath) -> UITableViewCell)?
    open func cellForRowAtIndexPath(_ indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        let cell = cellForRowAtIndexPathClosure?(tableView, indexPath)
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
  
    open func willDisplayCell(_ cell: UITableViewCell, indexPath: IndexPath) {

    }
  
    open func didEndDisplayingCell() {
        
    }
  
}
