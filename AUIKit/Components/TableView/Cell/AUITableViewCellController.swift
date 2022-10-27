import UIKit

public protocol AUITableViewCellController: AUIViewController {
    
    // MARK: - Prefetching
    
    func prefetchCell()
    
    func cancelPrefetchingForCell()
    
    // MARK: - Cell
    
    var cellType: UITableViewCell.Type { get }
    
    var cellIdentifier: String { get }
    
    var cell: UITableViewCell? { get set }
    
    // MARK: - Height
    
    func cellEstimatedHeight(_ width: CGFloat) -> CGFloat
    
    func cellHeight(_ width: CGFloat) -> CGFloat
    
    // MARK: - Selection
    
    var didSelect: (() -> Void)? { get set }
    
    func didSelectCell()
    
    // MARK: - Displaying
    
    var willDisplay: (() -> Void)? { get set }
    
    func willDisplayCell()
    
    var didEndDisplaying: (() -> Void)? { get set }
    
    func didEndDisplayingCell()
    
    // MARK: - Swiping
    
    @available(iOS 11.0, *)
    var cellLeadingSwipeActionsConfiguration: UISwipeActionsConfiguration? { get }
    
    @available(iOS 11.0, *)
    var cellTrailingSwipeActionsConfiguration: UISwipeActionsConfiguration? { get }
    
    // MARK: - Moving
    
    @available(iOS 11.0, *)
    func itemsForBeginning(session: UIDragSession) -> [UIDragItem]
    
    var canMoveCell: Bool { get }
}
