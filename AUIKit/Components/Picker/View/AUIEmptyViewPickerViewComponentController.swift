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
  
    open func width(_ size: CGSize) -> CGFloat {
        return 0
    }
    
    open func height(_ size: CGSize) -> CGFloat {
        return 0
    }
  
}
