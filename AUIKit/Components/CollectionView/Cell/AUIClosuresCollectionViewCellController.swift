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
    
    open var shouldSelectCellClosure: (() -> Bool)?
    open override var shouldSelectCell: Bool {
        return shouldSelectCellClosure?() ?? true
    }

}
