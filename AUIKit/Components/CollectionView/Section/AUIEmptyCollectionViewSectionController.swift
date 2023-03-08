import UIKit

open class AUIEmptyCollectionViewSectionController: AUICollectionViewSectionController {
    
    // MARK: Initializer

    public init() {
    
    }
  
    // MARK: Cells
  
    open var cellControllers: [AUICollectionViewCellController] = []
  
    public func sizeForCellAtIndex(_ index: Int) -> CGSize {
        return cellControllers[index].sizeForCell
    }
    
}
