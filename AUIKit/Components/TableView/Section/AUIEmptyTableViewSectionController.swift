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
        guard index < cellControllers.count else { return }
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
  
    open func willDisplayCell(_ cell: UITableViewCell, atIndex index: Int) {
        cellControllers[index].willDisplayCell(cell)
    }
  
    open func didSelectCellAtIndex(_ index: Int) {
        cellControllers[index].didSelectCell()
    }
    
    @available(iOS 11.0, *)
    open func leadingSwipeActionsConfigurationForRowAtIndexPath(_ index: Int) -> UISwipeActionsConfiguration? {
        return cellControllers[index].leadingSwipeActionsConfigurationForCell
    }
    
    @available(iOS 11.0, *)
    open func trailingSwipeActionsConfigurationForRowAtIndexPath(_ index: Int) -> UISwipeActionsConfiguration? {
        return cellControllers[index].trailingSwipeActionsConfigurationForCell
    }
    
    @available(iOS 11.0, *)
    open func itemsForBeginning(session: UIDragSession, at index: Int) -> [UIDragItem] {
        return cellControllers[index].itemsForBeginning(session: session)
    }
    
    open func canMoveRowAtIndex(_ index: Int) -> Bool {
        return cellControllers[index].canMoveCell
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
