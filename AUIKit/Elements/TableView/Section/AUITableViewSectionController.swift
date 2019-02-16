//
//  AUITableViewSectionController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 2/16/19.
//

import Foundation

public protocol AUITableViewSectionController: class {
  func header(tableView: UITableView) -> UIView?
  var headerHeight: CGFloat { get }
  var headerEstimatedHeight: CGFloat { get }
  func didEndDisplayingHeader()
  func footer(tableView: UITableView) -> UIView?
  var footerHeight: CGFloat { get }
  var footerEstimatedHeight: CGFloat { get }
  func didEndDisplayingFooter()
  
  var cellControllers: [AUITableViewCellController] { get set }
  
  var numberOfRows: Int { get }
  func cellForRowAtIndexPath(_ indexPath: IndexPath, tableView: UITableView) -> UITableViewCell
  func estimatedHeightForCellAtIndex(_ index: Int) -> CGFloat
  func heightForCellAtIndex(_ index: Int) -> CGFloat
  func didEndDisplayingCellAtIndex(index: Int)
  func willDisplayCell(_ cell: UITableViewCell, index: Int)
  func didSelectCellAtIndex(_ index: Int)
}
