import Foundation

open class AUIEmptyTitlePickerViewItemController: AUITitlePickerViewItemController {

    // MARK: Title
  
    open var title: String?
    open var attributedTitle: NSAttributedString?
  
    // MARK: Initializer
  
    public init(title: String?, attributedTitle: NSAttributedString?) {
        self.title = title
        self.attributedTitle = attributedTitle
    }
  
    // MARK: Select
    
    open func didSelect() {
        
    }
  
}
