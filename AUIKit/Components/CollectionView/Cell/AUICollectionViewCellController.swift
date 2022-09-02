import UIKit

public protocol AUICollectionViewCellController: AnyObject {
    func prefetchCell()
    func cancelPrefetchingForCell()
    func cellForItemAtIndexPath(_ indexPath: IndexPath) -> UICollectionViewCell
    func willDisplayCell(_ cell: UICollectionViewCell)
    func didEndDisplayingCell()
    var shouldSelectCell: Bool { get }
    func didSelectCell()
    var sizeForCell: CGSize { get }
}
