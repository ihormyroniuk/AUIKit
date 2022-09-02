import Foundation

open class AUIClosuresTitlePickerViewItemController: AUITitlePickerViewItemController {

    // MARK: Title
  
    open var titleClosure: (() -> String?)?
    open var title: String? {
        return titleClosure?()
    }
    open var attributedTitleClosure: (() -> NSAttributedString?)?
    open var attributedTitle: NSAttributedString? {
        return attributedTitleClosure?()
    }
  
    // MARK: Initializer
  
    public init() {
        setup()
    }
  
    // MARK: Setup
  
    open func setup() {
    
    }
    
    // MARK: Select
    
    open var didSelectClosure: (() -> Void)?
    open func didSelect() {
        didSelectClosure?()
    }
  
}
