//
//  TableViewSectionController.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/17/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIEmptyTableViewSectionController: AUITableViewSectionController {
    
    // MARK: Initializer

    public init() {
    
    }
  
    // MARK: Header
  
    open var headerController: AUITableViewHeaderFooterController?
  
    open func header() -> UIView? {
        return headerController?.view()
    }
  
    open var headerEstimatedHeight: CGFloat {
        return headerController?.estimatedHeight ?? 0
    }
    open var headerHeight: CGFloat {
        return headerController?.height ?? 0
    }
  
    open func willDisplayHeader() {
        headerController?.willDisplay()
    }
  
    open func didEndDisplayingHeader() {
        headerController?.didEndDisplaying()
    }
  
    // MARK: Cells
  
    open var cellControllers: [AUITableViewCellController] = []
  
    open var numberOfRows: Int {
        return cellControllers.count
    }
    
    open func prefetchCellAtIndex(_ index: Int) {
        cellControllers[index].prefetchCell()
    }
    
    open func cancelPrefetchingForCellAtIndex(_ index: Int) {
        cellControllers[index].cancelPrefetchingForCell()
    }
  
    open func cellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        return cellControllers[index].cellForRowAtIndexPath(indexPath)
    }
  
    open func estimatedHeightForCellAtIndex(_ index: Int) -> CGFloat {
        return cellControllers[index].estimatedHeight
    }
  
    open func heightForCellAtIndex(_ index: Int) -> CGFloat {
        return cellControllers[index].height
    }
  
    open func didEndDisplayingCellAtIndex(index: Int) {
        cellControllers[index].didEndDisplayingCell()
    }
  
    open func willDisplayCellAtIndex(_ index: Int) {
        cellControllers[index].willDisplayCell()
    }
  
    open func didSelectCellAtIndex(_ index: Int) {
        cellControllers[index].didSelectCell()
    }
  
    // MARK: Footer
  
    open var footerController: AUITableViewHeaderFooterController?
  
    open func footer() -> UIView? {
        return footerController?.view()
    }
  
    open var footerHeight: CGFloat {
        return footerController?.height ?? 0
    }
  
    open var footerEstimatedHeight: CGFloat {
        return footerController?.estimatedHeight ?? 0
    }
  
    open func willDisplayFooter() {
        footerController?.willDisplay()
    }
  
    open func didEndDisplayingFooter() {
        footerController?.didEndDisplaying()
    }
  
}
