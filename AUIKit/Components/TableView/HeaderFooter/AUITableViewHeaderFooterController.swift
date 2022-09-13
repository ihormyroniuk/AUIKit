import UIKit

public protocol AUITableViewHeaderFooterController: AUIViewController {
    
    // MARK: - UITableViewHeaderFooterView
    
    var headerFooterType: UITableViewHeaderFooterView.Type { get }
    
    var headerFooterIdentifier: String { get }
    
    var headerFooter: UITableViewHeaderFooterView? { get set }
        
    // MARK: - Height
    
    func headerFooterEstimatedHeight(_ width: CGFloat) -> CGFloat
    
    func headerFooterHeight(_ width: CGFloat) -> CGFloat
    
    // MARK: - Events
    
    var willDisplay: (() -> Void)? { get set }
    
    func willDisplayHeaderFooter()
    
    var didEndDisplaying: (() -> Void)? { get set }
    
    func didEndDisplayingHeaderFooter()
    
}
