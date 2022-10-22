import Foundation

public protocol AUIViewPickerViewController: AUIPickerViewController {
  
    // MARK: - ViewComponentControllers
  
    var viewComponentControllers: [AUIViewPickerViewComponentController] { get set }
    
    // MARK: - Loading
    
    func loadViewComponentControllers(_ viewComponentControllers: [AUIViewPickerViewComponentController])
    
    // MARK: - Reloading
    
    func reloadViewComponentController(_ viewComponentController: AUIViewPickerViewComponentController, viewItemControllers: [AUIViewPickerViewItemController])
    
}
