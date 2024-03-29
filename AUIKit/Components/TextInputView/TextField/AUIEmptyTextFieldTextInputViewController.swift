import UIKit

open class AUIEmptyTextFieldTextInputViewController: AUIEmptyViewController, AUITextFieldTextInputViewController {
    
    // MARK: - AUITextFieldTextInputView
    
    public var textFieldTextInputView: AUITextFieldTextInputView? {
        set { view = newValue }
        get { return view as? AUITextFieldTextInputView }
    }
    
    open override func setupView() {
        super.setupView()
        setupTextFieldInputView()
    }
    
    open func setupTextFieldInputView() {
        textFieldController?.textField = textFieldTextInputView?.textField
    }
    
    open override func unsetupView() {
        super.unsetupView()
        unsetupTextFieldInputView()
    }
    
    open func unsetupTextFieldInputView() {
        textFieldController?.textField = nil
    }
    
    // MARK: - AUITextFieldController
  
    open var textFieldController: AUITextFieldController? {
        didSet {
            didSetTextFieldController(oldValue)
        }
    }
    open func didSetTextFieldController(_ oldValue: AUITextFieldController?) {
        guard textFieldController !== oldValue else { return }
        oldValue?.didChangeText = nil
        oldValue?.didTapReturnKey = nil
        oldValue?.didBeginEditing = nil
        oldValue?.didEndEditing = nil
        oldValue?.didEndEditingReason = nil
        oldValue?.textField = nil
        textFieldController?.didChangeText = { [weak self] in
            guard let self = self else { return }
            self.textFieldControllerDidChangeText()
        }
        textFieldController?.didTapReturnKey = { [weak self] in
            guard let self = self else { return true }
            return self.textFieldControllerDidTapReturnKey()
        }
        textFieldController?.didBeginEditing = { [weak self] in
            guard let self = self else { return }
            self.textFieldControllerDidBeginEditing()
        }
        textFieldController?.didEndEditing = { [weak self] in
            guard let self = self else { return }
            self.textFieldControllerDidEndEditing()
        }
        textFieldController?.didEndEditingReason = { [weak self] reason in
            guard let self = self else { return }
            self.textFieldControllerDidEndEditingReason(reason)
        }
        textFieldController?.textField = textFieldTextInputView?.textField
    }
    
    // MARK: - Events
    
    open var didChangeText: (() -> Void)?

    open var didTapReturnKey: (() -> Bool)?
    
    open var didBeginEditing: (() -> Void)?
    
    open var didEndEditing: (() -> Void)?
    
    open var didEndEditingReason: ((UITextField.DidEndEditingReason) -> Void)?
    
    // MARK: - Actions
  
    open func textFieldControllerDidChangeText() {
        guard let didChangeText = didChangeText else { return }
        didChangeText()
    }
  
    open func textFieldControllerDidTapReturnKey() -> Bool {
        guard let didTapReturnKey = didTapReturnKey else { return true }
        return didTapReturnKey()
    }
  
    open func textFieldControllerDidBeginEditing() {
        guard let didBeginEditing = didBeginEditing else { return }
        didBeginEditing()
    }
  
    open func textFieldControllerDidEndEditing() {
        guard let didEndEditing = didEndEditing else { return }
        didEndEditing()
    }
  
    open func textFieldControllerDidEndEditingReason(_ reason: UITextField.DidEndEditingReason) {
        guard let didEndEditingReason = didEndEditingReason else { return }
        didEndEditingReason(reason)
    }
    
}
