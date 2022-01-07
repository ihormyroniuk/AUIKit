//
//  AUITableViewSectionController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 2/16/19.
//

import UIKit

public protocol AUITableViewSectionController: AnyObject {
  
    // MARK: Header
  
    func header() -> UIView?
    var headerEstimatedHeight: CGFloat { get }
    var headerHeight: CGFloat { get }
    func willDisplayHeader()
    func didEndDisplayingHeader()

    // MARK: Cells

    var cellControllers: [AUITableViewCellController] { get set }
    var numberOfRows: Int { get }
    func cellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell
    func estimatedHeightForCellAtIndex(_ index: Int) -> CGFloat
    func heightForCellAtIndex(_ index: Int) -> CGFloat
    func willDisplayCell(index: IndexPath)
    func didSelectCellAtIndex(_ index: Int)
    func didEndDisplayingCellAtIndex(index: Int)
    func prefetchCellAtIndex(_ index: Int)
    func cancelPrefetchingForCellAtIndex(_ index: Int)
    
    // MARK: Footer
  
    func footer() -> UIView?
    var footerEstimatedHeight: CGFloat { get }
    var footerHeight: CGFloat { get }
    func willDisplayFooter()
    func didEndDisplayingFooter()
    
}
