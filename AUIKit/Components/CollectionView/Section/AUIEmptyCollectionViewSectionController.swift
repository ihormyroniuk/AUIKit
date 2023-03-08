import UIKit

open class AUIEmptyCollectionViewSectionController: AUICollectionViewSectionController {
    
    public var minimumInteritemSpacing: CGFloat = 0
    public var minimumLineSpacing: CGFloat = 0
    
    // MARK: Initializer

    public init() {
    
    }
  
    // MARK: Cells
  
    open var cellControllers: [AUICollectionViewCellController] = []
  
    public func sizeForCellAtIndex(_ index: Int) -> CGSize {
        return cellControllers[index].sizeForCell
    }
    
}
