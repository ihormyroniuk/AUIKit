import UIKit

open class AUIScreenViewController: UIViewController {
  
    // MARK: - Initialization
  
    public init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
  
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        return nil
    }
  
    // MARK: - Setup
  
    open func setup() {
    
    }
    
}
