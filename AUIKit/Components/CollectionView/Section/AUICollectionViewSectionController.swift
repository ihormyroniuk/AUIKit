import UIKit

public protocol AUICollectionViewSectionController: AnyObject {
    
    // MARK: Cells

    var cellControllers: [AUICollectionViewCellController] { get set }
    var numberOfItems: Int { get }
    func shouldSelectItemAtIndex(_ index: Int) -> Bool
    func sizeForCellAtIndex(_ index: Int) -> CGSize
    
}
