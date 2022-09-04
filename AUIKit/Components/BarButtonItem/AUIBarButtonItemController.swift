import UIKit

public protocol AUIBarButtonItemController: AUIBarItemController {
    
    // MARK: - UIBarButtonItem
    
    var barButtonItem: UIBarButtonItem? { get set }
  
    // MARK: - Events
    
    var action: (() -> Void)? { get set }
  
}
