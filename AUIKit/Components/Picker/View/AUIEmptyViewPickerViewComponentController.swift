import UIKit

open class AUIEmptyViewPickerViewComponentController: AUIViewPickerViewComponentController {
    
    // MARK: - Initialization
    
    public init(viewItemControllers: [AUIViewPickerViewItemController]) {
        self.viewItemControllers = viewItemControllers
        setup()
    }
    
    // MARK: Setup
    
    open func setup() {
      
    }
    
    // MARK: - ViewItemControllers
  
    open var itemControllers: [AUIPickerViewItemController] {
        return viewItemControllers
    }
    open var viewItemControllers: [AUIViewPickerViewItemController] = []
  
    open var width: CGFloat = 0
    
    open var height: CGFloat = 0
  
}
