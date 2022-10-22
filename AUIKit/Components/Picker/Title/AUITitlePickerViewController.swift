import Foundation

public protocol AUITitlePickerViewController: AUIPickerViewController {
  
    // MARK: - TitleComponentControllers
  
    var titleComponentControllers: [AUITitlePickerViewComponentController] { get set }
    
    // MARK: - Loading
    
    func loadTitleComponentControllers(_ titleComponentControllers: [AUITitlePickerViewComponentController])
    
    // MARK: - Reloading
    
    func reloadTitleComponentController(_ titleComponentController: AUITitlePickerViewComponentController, titleItemControllers: [AUITitlePickerViewItemController])
    
}
