import UIKit

open class AUIEmptyViewPickerViewItemController: AUIViewPickerViewItemController {
  
    // MARK: View
  
    open func view(reusingView view: UIView?) -> UIView {
        return view ?? UIView()
    }
  
    // MARK: Initializer
  
    public init() {
        setup()
    }
  
    // MARK: Setup
  
    open func setup() {
    
    }
    
    // MARK: Select
    
    public func didSelect() {
        
    }
  
}
