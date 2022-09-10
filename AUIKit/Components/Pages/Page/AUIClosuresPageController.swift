import UIKit

open class AUIClosuresPageController: AUIEmptyPageController {
    
    // MARK: - UIViewController
  
    open var viewControllerClosure: (() -> UIViewController)?
    public override var viewController: UIViewController {
        return viewControllerClosure?() ?? UIViewController()
    }
    
}
