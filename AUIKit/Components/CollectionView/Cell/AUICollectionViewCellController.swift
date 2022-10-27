import UIKit

public protocol AUICollectionViewCellController: AnyObject {
    
    // MARK: - Prefetching
    
    func prefetchCell()
    
    func cancelPrefetchingForCell()
    
    // MARK: - Size
    
    var sizeForCell: CGSize { get }
    
    // MARK: - Cell
    
    func cellForItemAtIndexPath(_ indexPath: IndexPath) -> UICollectionViewCell
    
    // MARK: - Selection
    
    var shouldSelectCell: Bool { get }
    
    func didSelectCell()
    
    // MARK: - Displaying
    
    func willDisplayCell(_ cell: UICollectionViewCell)
    
    func didEndDisplayingCell()
    
}
