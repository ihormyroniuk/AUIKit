//
//  AUIEmptyTableViewCellController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 27.12.2021.
//

import UIKit

open class AUIEmptyTableViewCellController: AUITableViewCellController {
  
    // MARK: Initializer
  
    public init() {
        
    }
    
    // MARK: AUITableViewCellController
    
    open func prefetchCell() {
        
    }
    
    open func cancelPrefetchingForCell() {
        
    }
    
    open func cellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
  
    open var estimatedHeight: CGFloat {
        return 0
    }
  
    open var height: CGFloat {
        return 0
    }
  
    open func willDisplayCell() {

    }
    
    open func didSelectCell() {

    }
    
    open func didEndDisplayingCell() {

    }
    
    @available(iOS 11.0, *)
    open var leadingSwipeActionsConfigurationForCell: UISwipeActionsConfiguration? {
        return nil
    }
    
    @available(iOS 11.0, *)
    open var trailingSwipeActionsConfigurationForCell: UISwipeActionsConfiguration? {
        return nil
    }
    
    @available(iOS 11.0, *)
    open func itemsForBeginning(session: UIDragSession) -> [UIDragItem] {
        return []
    }
    
    open var canMoveCell: Bool {
        return false
    }
  
}
