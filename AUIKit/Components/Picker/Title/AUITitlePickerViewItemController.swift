import Foundation

public protocol AUITitlePickerViewItemController: AUIPickerViewItemController {
  
    // MARK: Title
  
    var title: String? { get }
    var attributedTitle: NSAttributedString? { get }
    
}
