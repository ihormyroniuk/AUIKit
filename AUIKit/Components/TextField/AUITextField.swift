import UIKit

public protocol AUITextFieldCanPerformActionDelegate: AnyObject {
    func textField(_ textField: AUITextField, canPerformAction action: Selector, withSender sender: Any?) -> Bool
}

open class AUITextField: UITextField {
  
    // MARK: - Initialization

    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: - Setup

    open func setup() {

    }
    
    // MARK: Actions
    
    open weak var canPerformActionDelegate: AUITextFieldCanPerformActionDelegate?
    
    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        let superCanPerformAction = super.canPerformAction(action, withSender: sender)
        return canPerformActionDelegate?.textField(self, canPerformAction: action, withSender: sender) ?? superCanPerformAction
    }

}
