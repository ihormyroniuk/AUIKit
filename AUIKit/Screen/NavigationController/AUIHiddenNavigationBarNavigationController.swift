import UIKit

open class AUIHiddenNavigationBarNavigationController: AUINavigationController {
    
    // MARK: - Setup
    
    open override func setup() {
        super.setup()
        setNavigationBarHidden(true, animated: false)
    }
    
}
