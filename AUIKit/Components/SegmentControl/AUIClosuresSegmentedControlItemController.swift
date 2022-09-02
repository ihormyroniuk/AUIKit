import UIKit

open class AUIClosuresSegmentedControlItemController: AUIEmptySegmentedControlItemController {
           
    open var didSelectClosure: (() -> Void)?
    open override func didSelect() {
        super.didSelect()
        didSelectClosure?()
    }
    
}
