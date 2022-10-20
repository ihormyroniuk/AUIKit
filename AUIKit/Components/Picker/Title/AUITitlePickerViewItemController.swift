import Foundation

public protocol AUITitlePickerViewItemController: AUIPickerViewItemController {
  
    // MARK: - Title
  
    var title: String? { get }
    
    var attributedTitle: NSAttributedString? { get }
    
    // MARK: - Selection
    
    var didSelect: (() -> Void)? { get set }
    
}
