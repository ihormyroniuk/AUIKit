import UIKit

open class AUIEmptyViewPickerViewItemController: AUIViewPickerViewItemController {
  
    // MARK: - View
  
    open func view(reusingView view: UIView?) -> UIView {
        return view ?? UIView()
    }
  
    // MARK: - Initialization
  
    public init() {
        setup()
    }
  
    // MARK: - Setup
  
    open func setup() {
    
    }
    
    // MARK: - Selection
    
    open var didSelect: (() -> Void)?
    
    public func didSelectItem() {
        guard let didSelect = didSelect else { return }
        didSelect()
    }
  
}
