import Foundation

public protocol AUITitlePickerViewComponentController: AUIPickerViewComponentController {
  
    // MARK: Items Controllers
  
    var titleItemControllers: [AUITitlePickerViewItemController] { get set }
    
}
