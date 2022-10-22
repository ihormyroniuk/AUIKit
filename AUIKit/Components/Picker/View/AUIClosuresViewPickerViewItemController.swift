import UIKit

open class AUIClosuresViewPickerViewItemController: AUIEmptyViewPickerViewItemController {
    
    // MARK: - Initialization
    
    open var viewReusingViewClosure: ((UIView?) -> UIView)?
    open override func view(reusingView view: UIView?) -> UIView {
        return viewReusingViewClosure?(view) ?? UIView()
    }
  
}
