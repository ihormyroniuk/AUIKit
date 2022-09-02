import Foundation

public protocol AUIViewPickerViewController: AUIPickerViewController {
  
    // MARK: Component Controllers
  
    var viewComponentControllers: [AUIViewPickerViewComponentController] { get set }
    
}
