import Foundation

public protocol AUIPickerViewComponentController: AnyObject {
  
    // MARK: - ItemControllers
  
    var itemControllers: [AUIPickerViewItemController] { get }
    
}
