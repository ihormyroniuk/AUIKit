import UIKit

public protocol AUIViewPickerViewComponentController: AUIPickerViewComponentController {
  
    // MARK: - ViewItemControllers
  
    var viewItemControllers: [AUIViewPickerViewItemController] { get set }
    
    var width: CGFloat { get }
    
    var height: CGFloat { get }
}
