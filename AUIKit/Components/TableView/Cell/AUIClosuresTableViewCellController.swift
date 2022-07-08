//
//  AUIElementTableViewCellController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/1/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
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
        let tableViewCell = cellForRowAtIndexPathClosure?(indexPath)
        self.tableViewCell = tableViewCell
        return tableViewCell ?? super.cellForRowAtIndexPath(indexPath)
    }
  
    open var estimatedHeightClosure: (() -> CGFloat)?
    open override var estimatedHeight: CGFloat {
        return estimatedHeightClosure?() ?? super.estimatedHeight
    }
  
    open var heightClosure: (() -> CGFloat)?
    open override var height: CGFloat {
        return heightClosure?() ?? super.height
    }
  
    open var willDisplayCellClosure: ((UITableViewCell) -> Void)?
    open override func willDisplayCell(_ cell: UITableViewCell) {
        super.willDisplayCell(cell)
        willDisplayCellClosure?(cell)
    }
    
    open var didSelectClosure: (() -> Void)?
    open override func didSelectCell() {
        super.didSelectCell()
        didSelectClosure?()
    }
    
    open var didEndDisplayingCellClosure: (() -> Void)?
    open override func didEndDisplayingCell() {
        super.didEndDisplayingCell()
        didEndDisplayingCellClosure?()
    }
    
    open var leadingSwipeActionsConfigurationForCellClosure: (() -> UISwipeActionsConfiguration?)?
    @available(iOS 11.0, *)
    open override var leadingSwipeActionsConfigurationForCell: UISwipeActionsConfiguration? {
        return leadingSwipeActionsConfigurationForCellClosure?()
    }
    
    open var trailingSwipeActionsConfigurationForCellClosure: (() -> UISwipeActionsConfiguration?)?
    @available(iOS 11.0, *)
    open override var trailingSwipeActionsConfigurationForCell: UISwipeActionsConfiguration? {
        return trailingSwipeActionsConfigurationForCellClosure?()
    }
    
    open var itemsForBeginningSessionClosure: ((UIDragSession) -> [UIDragItem])?
    @available(iOS 11.0, *)
    open override func itemsForBeginning(session: UIDragSession) -> [UIDragItem] {
        return itemsForBeginningSessionClosure?(session) ?? super.itemsForBeginning(session: session)
    }
    
    open var canMoveCellClosure: (() -> Bool)?
    open override var canMoveCell: Bool {
        return canMoveCellClosure?() ?? super.canMoveCell
    }
  
}
