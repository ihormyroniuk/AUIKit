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
    
    var estimatedHeight: CGFloat { get }
    
    var height: CGFloat { get }
    
    // MARK: - Events
    
    var willDisplay: (() -> Void)? { get set }
    
    func willDisplayCell()
    
    var didSelect: (() -> Void)? { get set }
    
    func didSelectCell()
    
    var didEndDisplaying: (() -> Void)? { get set }
    
    func didEndDisplayingCell()
    
    // MARK: - Swiping
    
    @available(iOS 11.0, *)
    var leadingSwipeActionsConfigurationForCell: UISwipeActionsConfiguration? { get }
    
    @available(iOS 11.0, *)
    var trailingSwipeActionsConfigurationForCell: UISwipeActionsConfiguration? { get }
    
    // MARK: - Moving
    
    @available(iOS 11.0, *)
    func itemsForBeginning(session: UIDragSession) -> [UIDragItem]
    
    var canMoveCell: Bool { get }
}
