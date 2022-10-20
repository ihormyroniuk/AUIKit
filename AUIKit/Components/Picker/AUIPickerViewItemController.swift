import Foundation

public protocol AUIPickerViewItemController: AnyObject {
    
    // MARK: - Selection
    
    var didSelect: (() -> Void)? { get set }
    
    func didSelectItem()
    
}
