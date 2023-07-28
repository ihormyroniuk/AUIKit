import UIKit

open class AUIEmptyCollectionViewSectionController: AUICollectionViewSectionController {
    
    // MARK: Initializer

    public init() {
    
    }
  
    // MARK: Cells
  
    open var cellControllers: [AUICollectionViewCellController] = []
  
    open func sizeForCellAtIndex(_ index: Int, size: CGSize) -> CGSize {
        return cellControllers[index].sizeForCell(size: size)
    }
    
}
