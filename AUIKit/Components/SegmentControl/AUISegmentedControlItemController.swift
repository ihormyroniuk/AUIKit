import UIKit

public protocol AUISegmentedControlItemController: AnyObject {
    
    // MARK: Title
    
    var title: String? { get }
    
    func didSelect()
    
}
