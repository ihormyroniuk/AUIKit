import UIKit

open class AUIEmptyBarButtonItemController: AUIEmptyBarItemController, AUIBarButtonItemController {
  
  // MARK: - UIBarButtonItem
  
    open var barButtonItem: UIBarButtonItem? {
        set { barItem = newValue }
        get { return barItem as? UIBarButtonItem }
    }
  
    open override func setupBarItem() {
        super.setupBarItem()
        setupBarButtonItem()
    }
    
    open func setupBarButtonItem() {
        barButtonItem?.target = self
        barButtonItem?.action = #selector(didSelectAction)
    }
  
    open override func unsetupBarItem() {
        super.unsetupBarItem()
        unsetupBarButtonItem()
    }
    
    open func unsetupBarButtonItem() {
        barButtonItem?.target = nil
        barButtonItem?.action = nil
    }
    
    // MARK: - Events
    
    open var action: (() -> Void)?
  
    // MARK: - Actions
  
    @objc open func didSelectAction() {
        guard let action = action else { return }
        action()
    }
    
}
