import UIKit

open class AUIAlertController: UIAlertController {
  
    // MARK: - Initialization
  
    public init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
  
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
  
    // MARK: - Setup
  
    open func setup() {
    
    }
    
}
