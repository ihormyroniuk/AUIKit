import UIKit

public protocol AUITableViewSectionController: AnyObject {
    
    // MARK: - Header
    
    var headerController: AUITableViewHeaderFooterViewController? { get set }
    
    // MARK: - Cells

    var cellControllers: [AUITableViewCellController] { get set }
    
    // MARK: - Footer
    
    var footerController: AUITableViewHeaderFooterViewController? { get set }
    
}
