import UIKit

open class AUIEmptyTableViewSectionController: AUITableViewSectionController {
    
    
    // MARK: - Initialization

    public init() {
    
    }
  
    // MARK: - Header
  
    open var headerController: AUITableViewHeaderFooterController?
  
    // MARK: - Cells
  
    open var cellControllers: [AUITableViewCellController] = []
  
    // MARK: - Footer
  
    open var footerController: AUITableViewHeaderFooterController?
  
}
