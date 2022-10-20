import Foundation

public protocol AUITitlePickerViewController: AUIPickerViewController {
  
    // MARK: Component Controllers
  
    var titleComponentControllers: [AUITitlePickerViewComponentController] { set get }
    
    // MARK: - Loading
    
    func loadComponents(_ componentControllers: [AUITitlePickerViewComponentController])
    
}
