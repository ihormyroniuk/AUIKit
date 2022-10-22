import UIKit

open class AUIEmptyViewPickerViewComponentController: AUIViewPickerViewComponentController {
    
    // MARK: - Initialization
    
    public init() {
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
  
    open var width: CGFloat {
        return 0
    }
    
    open var height: CGFloat {
        return 0
    }
  
}
