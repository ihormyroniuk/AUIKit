import UIKit

open class AUIEmptyButtonController: AUIEmptyControlController, AUIButtonController {
  
    // MARK: - UIButton
  
    open var button: UIButton? {
        set { view = newValue }
        get { return view as? UIButton }
    }
  
    open override func setupControl() {
        super.setupControl()
        setupButton()
    }
  
    open func setupButton() {
        button?.setTitle(normalTitle, for: .normal)
    }
  
    open override func unsetupControl() {
        super.unsetupControl()
        unsetupButton()
    }
  
    open func unsetupButton() {
    
    }
  
    // MARK: - Title
  
    open var title: String? {
        didSet { didSetTitle(oldValue: oldValue) }
    }
    open func didSetTitle(oldValue: String?) {
        normalTitle = title
    }
  
    open var normalTitle: String? {
        didSet { didSetNormalTitle(oldValue: oldValue) }
    }
    open func didSetNormalTitle(oldValue: String?) {
        button?.setTitle(title, for: .normal)
    }
  
}
