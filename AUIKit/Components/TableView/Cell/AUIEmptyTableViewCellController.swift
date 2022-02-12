//
//  AUIEmptyTableViewCellController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 27.12.2021.
//

import UIKit

open class AUIEmptyTableViewCellController: AUIEmptyViewController, AUITableViewCellController {
    
    // MARK: CollectionViewCell
  
    open var tableViewCell: UITableViewCell? {
        set { view = newValue }
        get { return view as? UITableViewCell }
    }
  
    open override func setupView() {
        super.setupView()
        setupTableViewCell()
    }
  
    open func setupTableViewCell() {
        
    }
  
    open override func unsetupView() {
        super.unsetupView()
        unsetupTableViewCell()
    }
  
    open func unsetupTableViewCell() {
    
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
        tableViewCell = nil
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
