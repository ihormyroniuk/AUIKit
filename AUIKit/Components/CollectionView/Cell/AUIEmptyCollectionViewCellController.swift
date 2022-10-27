import UIKit

open class AUIEmptyCollectionViewCellController: AUIEmptyViewController, AUICollectionViewCellController {
    
    // MARK: - Prefetching
    
    open func prefetchCell() {
        
    }
    
    open func cancelPrefetchingForCell() {
        
    }
  

    // MARK: CollectionViewCell
  
    open var collectionViewCell: UICollectionViewCell? {
        set { view = newValue }
        get { return view as? UICollectionViewCell }
    }
  
    open override func setupView() {
        super.setupView()
        setupCollectionViewCell()
    }
  
    open func setupCollectionViewCell() {
        
    }
  
    open override func unsetupView() {
        super.unsetupView()
        unsetupCollectionViewCell()
    }
  
    open func unsetupCollectionViewCell() {
    
    }
    
    // MARK: - Cell
    
    open func cellForItemAtIndexPath(_ indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    // MARK: - Size
    
    open var sizeForCell: CGSize {
        return .zero
    }
    
    // MARK: - Selection
  
    open var shouldSelectCell: Bool {
        return true
    }
    
    open func didSelectCell() {
        
    }
    
    // MARK: - Displaying
    
    open func willDisplayCell(_ cell: UICollectionViewCell) {
        if collectionViewCell != cell {
            collectionViewCell = cell
        }
    }
    
    open func didEndDisplayingCell() {
        collectionViewCell = nil
    }
    
}
