import UIKit

open class AUIClosuresCollectionViewCellController: AUIEmptyCollectionViewCellController {
  
    // MARK: AUICollectionViewCellController
    
    open var prefetchCellClosure: (() -> Void)?
    open override func prefetchCell() {
        super.prefetchCell()
        prefetchCellClosure?()
    }
    
    open var cancelPrefetchingForCellClosure: (() -> Void)?
    open override func cancelPrefetchingForCell() {
        super.cancelPrefetchingForCell()
        cancelPrefetchingForCellClosure?()
    }
    
    open var sizeForCellClosure: (() -> CGSize)?
    public override var sizeForCell: CGSize {
        return sizeForCellClosure?() ?? super.sizeForCell
    }
    
    open var willDisplayCellClosure: (() -> Void)?
    open override func willDisplayCell() {
        super.willDisplayCell()
        willDisplayCellClosure?()
    }
    
    open var didEndDisplayingCellClosure: (() -> Void)?
    open override func didEndDisplayingCell() {
        super.didEndDisplayingCell()
        didEndDisplayingCellClosure?()
    }
    
    open var shouldSelectCellClosure: (() -> Bool)?
    open override var shouldSelectCell: Bool {
        return shouldSelectCellClosure?() ?? true
    }
    
    open var didSelectClosure: (() -> Void)?
    open override func didSelectCell() {
        super.didSelectCell()
        didSelectClosure?()
    }

}
