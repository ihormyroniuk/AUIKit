import UIKit

public protocol AUICollectionViewSectionController: AnyObject {
    
    // MARK: Cells

    var cellControllers: [AUICollectionViewCellController] { get set }
    var minimumInteritemSpacing: CGFloat { get set }
    var minimumLineSpacing: CGFloat { get set }
    func sizeForCellAtIndex(_ index: Int) -> CGSize
    
}
