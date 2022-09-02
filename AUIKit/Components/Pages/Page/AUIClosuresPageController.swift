import UIKit

open class AUIClosuresPageController: AUIEmptyPageController {
  
    open var viewControllerClosure: (() -> UIViewController)?
    public override var viewController: UIViewController {
        return viewControllerClosure?() ?? UIViewController()
    }
    
}
