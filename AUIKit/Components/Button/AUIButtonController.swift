import UIKit

public protocol AUIButtonController: AUIControlController {
  
    // MARK: - Button
  
    var button: UIButton? { get set }
  
    // MARK: - Title
  
    var title: String? { get set }
    var normalTitle: String? { get set }
  
}
