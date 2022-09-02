import UIKit

public protocol AUIButtonController: AUIControlController {
  
    // MARK: - UIButton
  
    var button: UIButton? { get set }
  
    // MARK: - Title
  
    var title: String? { get set }
    
    var normalTitle: String? { get set }
  
}
