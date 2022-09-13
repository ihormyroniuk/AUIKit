import UIKit

@available(iOS 11.0, *)
open class AUIClosuresTableViewCellController: AUIEmptyTableViewCellController {
    
    // MARK: - Prefetching
    
    open var prefetchCellClosure: (() -> Void)?
    
    open override func prefetchCell() {
        prefetchCellClosure?()
    }
    
    open var cancelPrefetchingForCellClosure: (() -> Void)?
    
    open override func cancelPrefetchingForCell() {
        cancelPrefetchingForCellClosure?()
    }
    
    // MARK: - Swiping
    
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
    
    // MARK: - Moving
    
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
