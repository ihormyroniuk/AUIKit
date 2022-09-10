import UIKit

public protocol AUISegmentedControlController: AUIControlController {
    
    // MARK: - UISegmentedControl
    
    var segmentedControl: UISegmentedControl? { get set }
    
    // MARK: Items
    
    var itemControllers: [AUISegmentedControlItemController] { get set }
}
