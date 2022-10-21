import Foundation

public protocol AUITitlePickerViewController: AUIPickerViewController {
  
    // MARK: - TitleComponentControllers
  
    var titleComponentControllers: [AUITitlePickerViewComponentController] { get set }
    
    // MARK: - Loading
    
    func loadComponents(_ componentControllers: [AUITitlePickerViewComponentController])
    
    // MARK: - Reloading
    
    func reloadComponent(_ titleComponentController: AUITitlePickerViewComponentController, titleItemControllers: [AUITitlePickerViewItemController])
    
}
