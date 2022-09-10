import UIKit

public protocol AUIPageController: AnyObject {
    
    // MARK: - UIViewController
    
    var viewController: UIViewController { get }
    
    // MARK: - Events
    
    var willDisplay: (() -> Void)? { get set }
    
    var didDisplay: (() -> Void)? { get set }
    
    // MARK: - Actions
    
    func willDisplayPage()
    
    func didDisplayPage()
    
}
