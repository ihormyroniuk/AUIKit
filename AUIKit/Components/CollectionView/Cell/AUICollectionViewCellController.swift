import UIKit

public protocol AUICollectionViewCellController: AnyObject {
    
    // MARK: - Prefetching
    
    func prefetchCell()
    
    func cancelPrefetchingForCell()
    
    // MARK: - Size
    
    var sizeForCell: CGSize { get }
    
    // MARK: - Cell
    
    var cellType: UICollectionViewCell.Type { get }
    
    var cellIdentifier: String { get }
    
    var cell: UICollectionViewCell? { get set }
        
    // MARK: - Selection
    
    var shouldSelectCell: Bool { get }
    
    var didSelect: (() -> Void)? { get set }
    
    func didSelectCell()
    
    // MARK: - Displaying
    
    var willDisplay: (() -> Void)? { get set }
    
    func willDisplayCell()
    
    var didEndDisplaying: (() -> Void)? { get set }
    
    func didEndDisplayingCell()
    
}
