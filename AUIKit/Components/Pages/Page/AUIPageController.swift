import UIKit

public protocol AUIPageController: AnyObject {
    
    var viewController: UIViewController { get }
    
    // MARK: - Events
    
    var willDisplay: (() -> Void)? { get set }
    
    var didDisplay: (() -> Void)? { get set }
    
    // MARK: - Actions
    
    func willDisplayPage()
    
    func didDisplayPage()
    
}
