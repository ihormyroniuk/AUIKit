import UIKit

open class AUIEmptyTableViewSectionController: AUITableViewSectionController {
    
    
    // MARK: - Initialization

    public init() {
    
    }
  
    // MARK: - Header
  
    open var headerController: AUITableViewHeaderFooterViewController?
  
    // MARK: - Cells
  
    open var cellControllers: [AUITableViewCellController] = []
  
    // MARK: - Footer
  
    open var footerController: AUITableViewHeaderFooterViewController?
  
}
