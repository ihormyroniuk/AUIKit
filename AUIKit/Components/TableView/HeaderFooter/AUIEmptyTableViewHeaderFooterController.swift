import UIKit

open class AUIEmptyTableViewHeaderFooterController: AUITableViewHeaderFooterController {
  
    // MARK: - Initialization
  
    public init() {
      
    }
    
    // MARK: - UITableViewHeaderFooterView
  
    open func headerFooter() -> UITableViewHeaderFooterView? {
        return UITableViewHeaderFooterView()
    }
    
    // MARK: - Height
  
    open var estimatedHeight: CGFloat {
        return 0
    }
  
    open var height: CGFloat {
        return 0
    }
    
    // MARK: - Events
    
    open var willDisplay: (() -> Void)?
    
    public func willDisplayHeaderFooter() {
        
    }
    
    open var didEndDisplaying: (() -> Void)?
    
    open func didEndDisplayingHeaderFooter() {
        
    }
  
}
