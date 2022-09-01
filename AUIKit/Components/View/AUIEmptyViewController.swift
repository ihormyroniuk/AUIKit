import UIKit

open class AUIEmptyViewController: AUIViewController {

    // MARK: - Initialization
  
    public init() {
        setup()
    }
  
    // MARK: - Setup
  
    open func setup() {
        
    }
  
    // MARK: - View
  
    private var _view: UIView?
    open var view: UIView? {
        set {
            if newValue !== _view {
                unsetupView()
                _view = newValue
                setupView()
            }
        }
        get {
            return _view
        }
    }
  
    open func setupView() {
        view?.isUserInteractionEnabled = isUserInteractionEnabled
    }
  
    open func unsetupView() {
        
    }
  
    // MARK: - User Interaction
  
    open var isUserInteractionEnabled = true {
        didSet {
            didSetIsUserInteractionEnabled(oldValue: oldValue)
        }
    }
    open func didSetIsUserInteractionEnabled(oldValue: Bool) {
        view?.isUserInteractionEnabled = isUserInteractionEnabled
    }
  
    // MARK: - First Responder
  
    open var isFirstResponder: Bool {
        return view?.isFirstResponder ?? false
    }
  
    @discardableResult
    open func becomeFirstResponder() -> Bool {
        return view?.becomeFirstResponder() ?? false
    }
  
    @discardableResult
    open func resignFirstResponder() -> Bool {
        return view?.resignFirstResponder() ?? false
    }
  
}
