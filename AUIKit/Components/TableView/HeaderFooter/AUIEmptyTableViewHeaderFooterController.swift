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
  
    open func headerFooterEstimatedHeight(_ width: CGFloat) -> CGFloat {
        return .zero
    }
    
    open func headerFooterHeight(_ width: CGFloat) -> CGFloat {
        return .zero
    }
    
    // MARK: - Events
    
    open var willDisplay: (() -> Void)?
    
    open func willDisplayHeaderFooter() {
        
    }
    
    open var didEndDisplaying: (() -> Void)?
    
    open func didEndDisplayingHeaderFooter() {
        
    }
  
}
