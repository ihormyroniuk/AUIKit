import UIKit

open class AUIEmptySegmentedControlController: AUIEmptyControlController, AUISegmentedControlController {
    
    // MARK: - UISegmentedControl
      
    open var segmentedControl: UISegmentedControl? {
        set { view = newValue }
        get { return view as? UISegmentedControl }
    }
    
    open override func setupControl() {
        super.setupControl()
        setupSegmentedControl()
    }
    
    open func setupSegmentedControl() {
        segmentedControl?.removeAllSegments()
        var index = 0
        for itemController in itemControllers {
            if let title = itemController.title {
                segmentedControl?.insertSegment(withTitle: title, at: index, animated: false)
            }
            if itemController === selectedItemController {
                segmentedControl?.selectedSegmentIndex = index
            }
            index += 1
        }
    }
    
    open override func controlValueChangedEventAction() {
        if let selectedSegmentIndex = segmentedControl?.selectedSegmentIndex {
            let selectedItemController = itemControllers[selectedSegmentIndex]
            self.selectedItemController = selectedItemController
            selectedItemController.didSelect()
        }
        super.controlValueChangedEventAction()
    }
    
    // MARK: Items
    
    open var itemControllers: [AUISegmentedControlItemController] = [] {
        didSet {
            didSetItemControllers(oldValue: oldValue)
        }
    }
    open func didSetItemControllers(oldValue: [AUISegmentedControlItemController]) {
        
    }
  
    open var selectedItemController: AUISegmentedControlItemController? {
        didSet {
            didSetSelectedItemController(oldValue)
        }
    }
    open func didSetSelectedItemController(_ oldValue: AUISegmentedControlItemController?) {
        guard let index = itemControllers.firstIndex(where: { $0 === selectedItemController }) else { return }
        segmentedControl?.selectedSegmentIndex = index
    }
    
}
