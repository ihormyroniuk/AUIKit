import UIKit

open class AUIEmptySwitchController: AUIEmptyControlController, AUISwitchController {

    // MARK: - UISwitch
  
    open var `switch`: UISwitch? {
        set { view = newValue }
        get { return view as? UISwitch }
    }
  
    open override func setupView() {
        super.setupView()
        `switch`?.setOn(state, animated: false)
    }
  
    // MARK: State
    
    private var _state: Bool = false
    public var state: Bool {
        return _state
    }
    
    public func setState(_ state: Bool, animated: Bool) {
        let oldValue = _state
        _state = state
        didSetState(oldValue, animated: animated)
    }
    
    open func didSetState(_ oldValue: Bool, animated: Bool) {
        if oldValue != state {
            `switch`?.setOn(state, animated: animated)
            controlValueChangedEventAction()
        }
    }
}
