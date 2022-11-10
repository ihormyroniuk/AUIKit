import UIKit

public protocol AUIViewPickerViewComponentController: AUIPickerViewComponentController {
  
    // MARK: - ViewItemControllers
  
    var viewItemControllers: [AUIViewPickerViewItemController] { get set }
    
    func width(_ size: CGSize) -> CGFloat
    
    func height(_ size: CGSize) -> CGFloat
}
