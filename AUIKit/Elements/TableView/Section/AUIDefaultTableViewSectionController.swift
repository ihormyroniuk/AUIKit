//
//  TableViewSectionController.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/17/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultTableViewSectionController: AUITableViewSectionController {

  public init() {
    
  }
  
  // MARK: Header
  
  open var headerController: AUITableViewHeaderFooterController?
  
  open func header(tableView: UITableView) -> UIView? {
    return headerController?.view(tableView: tableView)
  }
  
  open var headerEstimatedHeight: CGFloat {
    return headerController?.estimatedHeight ?? 0
  }
  open var headerHeight: CGFloat {
    return headerController?.height ?? 0
  }
  
  open func willDisplayHeader(_ view: UIView) {
    
  }
  
  open func didEndDisplayingHeader() {
    headerController?.didEndDisplaying()
  }
  
  // MARK: Cells
  
  open var cellControllers: [AUITableViewCellController] = []
  
  open var numberOfRows: Int { return cellControllers.count }
  
  open func cellForRowAtIndexPath(_ indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
    let index = indexPath.row
    return cellControllers[index].cellForRowAtIndexPath(indexPath, tableView: tableView)
  }
  
  open func estimatedHeightForCellAtIndex(_ index: Int) -> CGFloat {
    return cellControllers[index].estimatedHeight
  }
  
  open func heightForCellAtIndex(_ index: Int) -> CGFloat {
    return cellControllers[index].height
  }
  
  open func didEndDisplayingCellAtIndex(index: Int) {
    if cellControllers.count > index {
      cellControllers[index].didEndDisplayingCell()
    }
  }
  
  open func willDisplayCell(_ cell: UITableViewCell, index: IndexPath) {
    cellControllers[index.row].willDisplayCell(cell, indexPath: index)
  }
  
  open func didSelectCellAtIndex(_ index: Int) {
    cellControllers[index].didSelectCell()
  }
  
  // MARK: Footer
  
  open var footerController: AUITableViewHeaderFooterController?
  
  open func footer(tableView: UITableView) -> UIView? {
    return footerController?.view(tableView: tableView)
  }
  
  open var footerHeight: CGFloat {
    return footerController?.height ?? 0
  }
  
  open var footerEstimatedHeight: CGFloat {
    return footerController?.estimatedHeight ?? 0
  }
  
  open func willDisplayFooter(_ view: UIView) {
    
  }
  
  open func didEndDisplayingFooter() {
    footerController?.didEndDisplaying()
  }
  
}
