import Foundation

open class AUIEmptyTitlePickerViewItemController: AUITitlePickerViewItemController {
    
    // MARK: - Initialization
  
    public init(title: String?) {
        self.title = title
        self.attributedTitle = nil
    }
    
    public init(attributedTitle: NSAttributedString?) {
        self.title = nil
        self.attributedTitle = attributedTitle
    }

    // MARK: - Title
  
    public let title: String?
    
    public let attributedTitle: NSAttributedString?
  
    // MARK: - Selection
    
    open var didSelect: (() -> Void)?
    
    open func didSelectItem() {
        guard let didSelect = didSelect else { return }
        didSelect()
    }
  
}
