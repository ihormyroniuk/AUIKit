import UIKit

open class AUIEmptyTableViewHeaderFooterController: AUIEmptyViewController {
  
    // MARK: - UITableViewHeaderFooterView
  
    open var headerFooterType: UITableViewHeaderFooterView.Type { return UITableViewHeaderFooterView.self }
    
    open var headerFooterIdentifier: String { return String(describing: headerFooterType.self) }
    
    open var headerFooter: UITableViewHeaderFooterView? {
        set { view = newValue }
        get { return view as? UITableViewHeaderFooterView }
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
