import UIKit

open class AUIEmptyPageController: AUIPageController {
    
    // MARK: - Initialization
  
    public init() {
        
    }
    
    // MARK: - UIViewController
    
    public var viewController: UIViewController {
        return UIViewController()
    }
    
    // MARK: - Events
    
    open var willDisplay: (() -> Void)?
    
    open var didDisplay: (() -> Void)?
    
    // MARK: - Actions
    
    open func willDisplayPage() {
        guard let willDisplay = willDisplay else { return }
        willDisplay()
    }
    
    open func didDisplayPage() {
        guard let didDisplay = didDisplay else { return }
        didDisplay()
    }
    
}
