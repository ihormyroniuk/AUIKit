import UIKit

public protocol AUIViewPickerViewItemController: AUIPickerViewItemController {
  
    // MARK: - View
  
    func view(reusingView view: UIView?) -> UIView
  
}
