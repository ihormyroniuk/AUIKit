//
//  AUIElementTableViewCellController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/1/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIClosuresTableViewCellController: AUIEmptyTableViewCellController {
  
    // MARK: TableViewCellController
    
    open var prefetchCellClosure: (() -> Void)?
    open override func prefetchCell() {
        prefetchCellClosure?()
    }
    
    open var cancelPrefetchingForCellClosure: (() -> Void)?
    open override func cancelPrefetchingForCell() {
        cancelPrefetchingForCellClosure?()
    }
    
    open var cellForRowAtIndexPathClosure: ((IndexPath) -> UITableViewCell)?
    open override func cellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell {
        let cell = cellForRowAtIndexPathClosure?(indexPath)
        return cell ?? UITableViewCell()
    }
  
    open var estimatedHeightClosure: (() -> CGFloat)?
    open override var estimatedHeight: CGFloat {
        return estimatedHeightClosure?() ?? 0
    }
  
    open var heightClosure: (() -> CGFloat)?
    open override var height: CGFloat {
        return heightClosure?() ?? 0
    }
  
    open var willDisplayCellClosure: (() -> Void)?
    open override func willDisplayCell() {
        willDisplayCellClosure?()
    }
    
    open var didSelectClosure: (() -> Void)?
    open override func didSelectCell() {
        didSelectClosure?()
    }
    
    open var didEndDisplayingCellClosure: (() -> Void)?
    open override func didEndDisplayingCell() {
        didEndDisplayingCellClosure?()
    }
  
}
