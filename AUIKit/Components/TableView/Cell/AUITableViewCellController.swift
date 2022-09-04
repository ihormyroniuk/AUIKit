import UIKit

public protocol AUITableViewCellController: AnyObject {
    func prefetchCell()
    func cancelPrefetchingForCell()
    func cellForRowAtIndexPath(_ indexPath: IndexPath) -> UITableViewCell
    var estimatedHeight: CGFloat { get }
    var height: CGFloat { get }
    func willDisplayCell(_ cell: UITableViewCell)
    func didSelectCell()
    func didEndDisplayingCell()
    @available(iOS 11.0, *)
    var leadingSwipeActionsConfigurationForCell: UISwipeActionsConfiguration? { get }
    @available(iOS 11.0, *)
    var trailingSwipeActionsConfigurationForCell: UISwipeActionsConfiguration? { get }
    @available(iOS 11.0, *)
    func itemsForBeginning(session: UIDragSession) -> [UIDragItem]
    var canMoveCell: Bool { get }
}
