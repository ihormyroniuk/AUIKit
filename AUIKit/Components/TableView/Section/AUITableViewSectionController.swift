import UIKit

public protocol AUITableViewSectionController: AnyObject {
    
    // MARK: - Header
    
    var headerController: AUITableViewHeaderFooterController? { get set }
    
    // MARK: - Cells

    var cellControllers: [AUITableViewCellController] { get set }
    
    // MARK: - Footer
    
    var footerController: AUITableViewHeaderFooterController? { get set }
    
}
