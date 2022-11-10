import UIKit

public protocol AUICollectionViewSectionController: AnyObject {
    
    // MARK: Cells

    var cellControllers: [AUICollectionViewCellController] { get set }
    func sizeForCellAtIndex(_ index: Int) -> CGSize
    
}
