import UIKit

open class AUIEmptyCollectionViewCellController: AUIEmptyViewController, AUICollectionViewCellController {
    
    // MARK: - Prefetching
    
    open func prefetchCell() {
        
    }
    
    open func cancelPrefetchingForCell() {
        
    }
    
    // MARK: - Cell
    
    open var cellType: UICollectionViewCell.Type { return UICollectionViewCell.self }
    
    open var cellIdentifier: String { return String(describing: cellType.self) }
  
    open var cell: UICollectionViewCell? {
        set { view = newValue }
        get { return view as? UICollectionViewCell }
    }
  
    open override func setupView() {
        super.setupView()
        setupCell()
    }
  
    open func setupCell() {
        
    }
  
    open override func unsetupView() {
        super.unsetupView()
        unsetupCell()
    }
  
    open func unsetupCell() {
    
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
    
    open func willDisplayCell() {
        
    }
    
    open func didEndDisplayingCell() {

    }
    
}
