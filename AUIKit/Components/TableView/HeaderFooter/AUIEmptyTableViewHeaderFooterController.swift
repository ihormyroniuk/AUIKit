import UIKit

open class AUIEmptyTableViewHeaderFooterController: AUITableViewHeaderFooterController {
  
    // MARK: Initializer
  
    public init() {
      
    }
    
    // MARK: AUITableViewHeaderFooterController
  
    open func view() -> UITableViewHeaderFooterView? {
        return UITableViewHeaderFooterView()
    }
  
    open var estimatedHeight: CGFloat {
        return 0
    }
  
    open var height: CGFloat {
        return 0
    }
    
    public func willDisplay() {
        
    }
    
    open func didEndDisplaying() {
        
    }
  
}
