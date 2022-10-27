import UIKit

open class AUIEmptyCollectionViewSectionController: AUICollectionViewSectionController {
    
    // MARK: Initializer

    public init() {
    
    }
  
    // MARK: Cells
  
    open var cellControllers: [AUICollectionViewCellController] = []
  
    open var numberOfItems: Int {
        return cellControllers.count
    }
    
    open func shouldSelectItemAtIndex(_ index: Int) -> Bool {
        return cellControllers[index].shouldSelectCell
    }
    
    open func didSelectCellAtIndex(_ index: Int) {
        cellControllers[index].didSelectCell()
    }
  
    public func sizeForCellAtIndex(_ index: Int) -> CGSize {
        return cellControllers[index].sizeForCell
    }
    
}
