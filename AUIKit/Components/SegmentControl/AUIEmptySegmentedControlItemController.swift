import UIKit

open class AUIEmptySegmentedControlItemController: AUISegmentedControlItemController {
    
    public init(title: String?) {
        self.title = title
    }
     
    public let title: String?
      
    open func didSelect() {
        
    }
}
