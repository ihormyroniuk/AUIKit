import UIKit

open class AUIEmptyTableViewHeaderFooterViewController: AUIEmptyViewController, AUITableViewHeaderFooterViewController {
  
    // MARK: - UITableViewHeaderFooterView
  
    open var headerFooterViewType: UITableViewHeaderFooterView.Type { return UITableViewHeaderFooterView.self }
    
    open var headerFooterViewIdentifier: String { return String(describing: headerFooterViewType.self) }
    
    open var headerFooterView: UITableViewHeaderFooterView? {
        set { view = newValue }
        get { return view as? UITableViewHeaderFooterView }
    }
    
    open override func setupView() {
        super.setupView()
        setupHeaderFooterView()
    }
  
    open func setupHeaderFooterView() {
        
    }
  
    open override func unsetupView() {
        super.unsetupView()
        unsetupHeaderFooterView()
    }
  
    open func unsetupHeaderFooterView() {
    
    }
    
    // MARK: - Height
  
    open func headerFooterViewEstimatedHeight(_ width: CGFloat) -> CGFloat {
        return .zero
    }
    
    open func headerFooterViewHeight(_ width: CGFloat) -> CGFloat {
        return .zero
    }
    
    // MARK: - Displaying
    
    open var willDisplay: (() -> Void)?
    
    open func willDisplayHeaderFooterView() {
        guard let willDisplay = willDisplay else { return }
        willDisplay()
    }
    
    open var didEndDisplaying: (() -> Void)?
    
    open func didEndDisplayingHeaderFooterView() {
        guard let didEndDisplaying = didEndDisplaying else { return }
        didEndDisplaying()
    }
  
}
