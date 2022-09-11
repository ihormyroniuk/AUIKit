import UIKit

public protocol AUITableViewSectionController: AnyObject {
  
    // MARK: Header
  
    func header() -> UITableViewHeaderFooterView?
    var headerEstimatedHeight: CGFloat { get }
    var headerHeight: CGFloat { get }
    func willDisplayHeader()
    func didEndDisplayingHeader()

    // MARK: Cells

    var cellControllers: [AUITableViewCellController] { get set }
    var numberOfRows: Int { get }
    func prefetchCellAtIndex(_ index: Int)
    func cancelPrefetchingForCellAtIndex(_ index: Int)
    func estimatedHeightForCellAtIndex(_ index: Int) -> CGFloat
    func heightForCellAtIndex(_ index: Int) -> CGFloat
    func willDisplayCell(atIndex index: Int)
    func didSelectCellAtIndex(_ index: Int)
    func didEndDisplayingCellAtIndex(index: Int)
    @available(iOS 11.0, *)
    func leadingSwipeActionsConfigurationForRowAtIndexPath(_ index: Int) -> UISwipeActionsConfiguration?
    @available(iOS 11.0, *)
    func trailingSwipeActionsConfigurationForRowAtIndexPath(_ index: Int) -> UISwipeActionsConfiguration?
    @available(iOS 11.0, *)
    func itemsForBeginning(session: UIDragSession, at index: Int) -> [UIDragItem]
    func canMoveRowAtIndex(_ index: Int) -> Bool
    
    // MARK: Footer
  
    func footer() -> UITableViewHeaderFooterView?
    var footerEstimatedHeight: CGFloat { get }
    var footerHeight: CGFloat { get }
    func willDisplayFooter()
    func didEndDisplayingFooter()
    
}
