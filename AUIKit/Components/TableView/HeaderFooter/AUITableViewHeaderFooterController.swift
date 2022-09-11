import UIKit

public protocol AUITableViewHeaderFooterController: AnyObject {
    
    func headerFooter() -> UITableViewHeaderFooterView?
    
    // MARK: - Height
    
    var estimatedHeight: CGFloat { get }
    
    var height: CGFloat { get }
    
    // MARK: - Events
    
    var willDisplay: (() -> Void)? { get set }
    
    func willDisplayHeaderFooter()
    
    var didEndDisplaying: (() -> Void)? { get set }
    
    func didEndDisplayingHeaderFooter()
    
}
