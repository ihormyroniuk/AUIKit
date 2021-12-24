//
//  AUITableViewSectionController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 2/16/19.
//

import Foundation

public protocol AUITableViewSectionController: AnyObject {
  
    // MARK: Header
  
    func header(tableView: UITableView) -> UIView?
    var headerEstimatedHeight: CGFloat { get }
    var headerHeight: CGFloat { get }
    func willDisplayHeader(_ view: UIView)
    func didEndDisplayingHeader()

    // MARK: Cells

    var cellControllers: [AUITableViewCellController] { get set }
    var numberOfRows: Int { get }
    func cellForRowAtIndexPath(_ indexPath: IndexPath, tableView: UITableView) -> UITableViewCell
    func estimatedHeightForCellAtIndex(_ index: Int) -> CGFloat
    func heightForCellAtIndex(_ index: Int) -> CGFloat
    func willDisplayCell(_ cell: UITableViewCell, index: IndexPath)
    func didSelectCellAtIndex(_ index: Int)
    func didEndDisplayingCellAtIndex(index: Int)

    // MARK: Footer
  
    func footer(tableView: UITableView) -> UIView?
    var footerEstimatedHeight: CGFloat { get }
    var footerHeight: CGFloat { get }
    func willDisplayFooter(_ view: UIView)
    func didEndDisplayingFooter()
    
}
