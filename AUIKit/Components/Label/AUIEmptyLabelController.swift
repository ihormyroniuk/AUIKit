import UIKit

open class AUIEmptyLabelController: AUIEmptyViewController, AUILabelController {
  
    // MARK: - UILabel
  
    open var label: UILabel? {
        set { view = newValue }
        get { return view as? UILabel }
    }
  
    open override func setupView() {
        super.setupView()
        setupLabel()
    }
  
    open func setupLabel() {
        label?.text = text
    }
  
    open override func unsetupView() {
        super.unsetupView()
        unsetupLabel()
    }
  
    open func unsetupLabel() {
    
    }
  
    // MARK: - Text
  
    open var text: String? {
        didSet { didSetText(oldValue: oldValue) }
    }
    open func didSetText(oldValue: String?) {
        label?.text = text
    }
  
}
