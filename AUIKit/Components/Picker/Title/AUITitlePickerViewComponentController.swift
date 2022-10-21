import Foundation

public protocol AUITitlePickerViewComponentController: AUIPickerViewComponentController {
  
    // MARK: - TitleItemControllers
  
    var titleItemControllers: [AUITitlePickerViewItemController] { get set }
    
}
