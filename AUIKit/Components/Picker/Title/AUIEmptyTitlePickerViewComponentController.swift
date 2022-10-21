import Foundation

open class AUIEmptyTitlePickerViewComponentController: AUITitlePickerViewComponentController {
    
    // MARK: - Initialization
    
    public init(titleItemControllers: [AUITitlePickerViewItemController]) {
        self.titleItemControllers = titleItemControllers
        setup()
    }
  
    // MARK: - TitleItemControllers
  
    open var itemControllers: [AUIPickerViewItemController] {
        return titleItemControllers
    }
    open var titleItemControllers: [AUITitlePickerViewItemController] = []
  
    // MARK: - Setup
    
    open func setup() {
    
    }
    
}
