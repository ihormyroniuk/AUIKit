import UIKit

public protocol AUITableViewHeaderFooterViewController: AUIViewController {
    
    // MARK: - UITableViewHeaderFooterView
    
    var headerFooterViewType: UITableViewHeaderFooterView.Type { get }
    
    var headerFooterViewIdentifier: String { get }
    
    var headerFooterView: UITableViewHeaderFooterView? { get set }
        
    // MARK: - Height
    
    func headerFooterViewEstimatedHeight(_ width: CGFloat) -> CGFloat
    
    func headerFooterViewHeight(_ width: CGFloat) -> CGFloat
    
    // MARK: - Displaying
    
    var willDisplay: (() -> Void)? { get set }
    
    func willDisplayHeaderFooterView()
    
    var didEndDisplaying: (() -> Void)? { get set }
    
    func didEndDisplayingHeaderFooterView()
    
}
