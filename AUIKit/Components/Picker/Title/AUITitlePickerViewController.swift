import Foundation

public protocol AUITitlePickerViewController: AUIPickerViewController {
  
    // MARK: Component Controllers
  
    var titleComponentControllers: [AUITitlePickerViewComponentController] { set get }
    
}
