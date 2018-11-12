//
//  AUIElementTableViewSectionController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/1/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

class AUIElementTableViewSectionController {
  
  // MARK: Header, Footer
  
  var headerController: AUITableViewHeaderFooterController?
  
  func header(tableView: UITableView) -> UIView? {
    return headerController?.view(tableView: tableView)
  }
  
  var headerHeight: CGFloat {
    return headerController?.height ?? 0
  }
  
  var headerEstimatedHeight: CGFloat {
    return headerController?.estimatedHeight ?? 0
  }
  
  func didEndDisplayingHeader() {
    headerController?.didEndDisplaying()
  }
  
  var footerController: AUITableViewHeaderFooterController?
  
  func footer(tableView: UITableView) -> UIView? {
    return footerController?.view(tableView: tableView)
  }
  
  var footerHeight: CGFloat {
    return footerController?.height ?? 0
  }
  
  var footerEstimatedHeight: CGFloat {
    return footerController?.estimatedHeight ?? 0
  }
  
  func didEndDisplayingFooter() {
    footerController?.didEndDisplaying()
  }
  
  // MARK: Cells
  
  var cellControllers: [AUITableViewCellController] = []
  
  var numberOfRows: Int { return cellControllers.count }
  
  func cellForRowAtIndexPath(_ indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
    let index = indexPath.row
    return cellControllers[index].cellForRowAtIndexPath(indexPath, tableView: tableView)
  }
  
  func estimatedHeightForCellAtIndex(_ index: Int) -> CGFloat {
    return cellControllers[index].estimatedHeight
  }
  
  func heightForCellAtIndex(_ index: Int) -> CGFloat {
    return cellControllers[index].height
  }
  
  func didEndDisplayingCellAtIndex(index: Int) {
    if cellControllers.count > index {
      cellControllers[index].didEndDisplayingCell()
    }
  }
  
  func willDisplayCell(_ cell: UITableViewCell, index: Int) {
    cellControllers[index].willDisplayCell(cell)
  }
  
  func didSelectCellAtIndex(_ index: Int) {
    cellControllers[index].didSelectCell()
  }
  
}
