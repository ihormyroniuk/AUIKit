import UIKit

open class AUIEmptyControlController: AUIEmptyViewController, AUIControlController {
  
    // MARK: - UIControl
  
    open var control: UIControl? {
        set { view = newValue }
        get { return view as? UIControl }
    }
  
    open override func setupView() {
        super.setupView()
        setupControl()
    }
  
    open func setupControl() {
        control?.isEnabled = isEnabled
        control?.addTarget(self, action: #selector(controlTouchDownEventAction), for: .touchDown)
        control?.addTarget(self, action: #selector(controlTouchUpInsideEventAction), for: .touchUpInside)
        control?.addTarget(self, action: #selector(controlTouchUpOutsideEventAction), for: .touchUpOutside)
        control?.addTarget(self, action: #selector(controlValueChangedEventAction), for: .valueChanged)
        control?.addTarget(self, action: #selector(controlEditingChangedEventAction), for: .editingChanged)
    }
  
    open override func unsetupView() {
        super.unsetupView()
        unsetupControl()
    }
  
    open func unsetupControl() {
        control?.removeTarget(self, action: #selector(controlTouchDownEventAction), for: .touchDown)
        control?.removeTarget(self, action: #selector(controlTouchUpInsideEventAction), for: .touchUpInside)
        control?.removeTarget(self, action: #selector(controlTouchUpOutsideEventAction), for: .touchUpOutside)
        control?.removeTarget(self, action: #selector(controlValueChangedEventAction), for: .valueChanged)
        control?.removeTarget(self, action: #selector(controlEditingChangedEventAction), for: .editingChanged)
    }
  
    // MARK: - Enabled
  
    open var isEnabled: Bool = true {
        didSet {
            didSetIsEnabled(oldValue: oldValue)
        }
    }
    open func didSetIsEnabled(oldValue: Bool) {
        control?.isEnabled = isEnabled
    }
    
    // MARK: - Events
    
    open var touchDown: (() -> Void)?
    
    open var touchUpInside: (() -> Void)?
    
    open var touchUpOutside: (() -> Void)?
    
    open var valueChanged: (() -> Void)?
    
    open var editingChanged: (() -> Void)?
  
    // MARK: - Actions
  
    @objc open func controlTouchDownEventAction() {
        guard let touchDown = touchDown else { return }
        touchDown()
    }
  
    @objc open func controlTouchUpInsideEventAction() {
        guard let touchUpInside = touchUpInside else { return }
        touchUpInside()
    }
  
    @objc open func controlTouchUpOutsideEventAction() {
        guard let touchUpOutside = touchUpOutside else { return }
        touchUpOutside()
    }
  
    @objc open func controlValueChangedEventAction() {
        guard let valueChanged = valueChanged else { return }
        valueChanged()
    }

    @objc open func controlEditingChangedEventAction() {
        guard let editingChanged = editingChanged else { return }
        editingChanged()
    }
  
}
