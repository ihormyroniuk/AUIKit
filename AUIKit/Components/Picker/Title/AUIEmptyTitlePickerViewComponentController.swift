import Foundation

open class AUIEmptyTitlePickerViewComponentController: AUITitlePickerViewComponentController {
  
    // MARK: Items Controllers
  
    open var itemControllers: [AUIPickerViewItemController] {
        return titleItemControllers
    }
    open var titleItemControllers: [AUITitlePickerViewItemController] = []
  
    // MARK: Initializer
  
    public init() {
        setup()
    }
  
    // MARK: Setup
    
    open func setup() {
    
    }
    
}
