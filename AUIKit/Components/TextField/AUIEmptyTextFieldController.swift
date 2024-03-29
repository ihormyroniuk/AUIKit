import UIKit

private let UITextFieldTextPropertyKey = "text"

open class AUIEmptyTextFieldController: AUIEmptyControlController, AUITextFieldController {
  
    // MARK: - Setup
  
    open override func setup() {
        super.setup()
        keyValueObserverProxy.delegate = self
        textFieldDelegate.delegate = self
    }
  
    // MARK: - UITextField
  
    open var textField: UITextField? {
        set { view = newValue }
        get { return view as? UITextField }
    }
  
    open override func setupControl() {
        super.setupControl()
        setupTextField()
    }
  
    open func setupTextField() {
        inputAccessoryViewController?.view = textField?.inputAccessoryView
        inputViewController?.view = textField?.inputView
        textField?.placeholder = placeholder
        textField?.keyboardType = keyboardType
        textField?.isSecureTextEntry = isSecureTextEntry
        textField?.autocorrectionType = autocorrectionType
        textField?.autocapitalizationType = autocapitalizationType
        textField?.returnKeyType = returnKeyType
        textField?.spellCheckingType = spellCheckingType
        textField?.text = text
        textField?.delegate = textFieldDelegate
        textField?.addObserver(keyValueObserverProxy, forKeyPath: UITextFieldTextPropertyKey, options: [.new, .old], context: nil)
    }
  
    open override func unsetupControl() {
        super.unsetupControl()
        unsetupTextField()
    }
  
    func unsetupTextField() {
        inputAccessoryViewController?.view = nil
        inputViewController?.view = nil
        textField?.delegate = nil
        textField?.removeObserver(keyValueObserverProxy, forKeyPath: UITextFieldTextPropertyKey, context: nil)
    }
    
    // MARK: - InputAccessoryViewController
  
    open var inputAccessoryViewController: AUIViewController? {
        didSet { didSetInputAccessoryViewController(oldValue: oldValue) }
    }
    open func didSetInputAccessoryViewController(oldValue: AUIViewController?) {
        oldValue?.view = nil
        inputAccessoryViewController?.view = textField?.inputAccessoryView
    }
  
    // MARK: - InputViewController
  
    open var inputViewController: AUIViewController? {
        didSet { didSetInputViewController(oldValue: oldValue) }
    }
    open func didSetInputViewController(oldValue: AUIViewController?) {
        oldValue?.view = nil
        inputViewController?.view = textField?.inputView
    }
  
    // MARK: - Text

    open var text: String? {
        didSet {
            didSetText(oldValue: oldValue)
        }
    }
    open func didSetText(oldValue: String?) {
        if oldValue != text {
            textField?.text = text
            if let changeText = didChangeText {
                changeText()
            }
        }
    }
    
    // MARK: - Placeholder
  
    open var placeholder: String? {
        didSet {
            didSetPlaceholder(oldValue: oldValue)
        }
    }
    open func didSetPlaceholder(oldValue: String?) {
        textField?.placeholder = placeholder
    }
    
    // MARK: - Security
    
    open var isSecureTextEntry: Bool = false {
        didSet {
            didSetIsSecureTextEntry(oldValue: oldValue)
        }
    }
    open func didSetIsSecureTextEntry(oldValue: Bool) {
        textField?.isSecureTextEntry = isSecureTextEntry
    }
    
    // MARK: - Keyboard
  
    open var keyboardType: UIKeyboardType = .default {
        didSet {
            didSetKeyboardType(oldValue: oldValue)
        }
    }
    open func didSetKeyboardType(oldValue: UIKeyboardType) {
        textField?.keyboardType = keyboardType
    }
  
    open var autocorrectionType: UITextAutocorrectionType = .default {
        didSet {
            didSetAutocorrectionType(oldValue: oldValue)
        }
    }
    open func didSetAutocorrectionType(oldValue: UITextAutocorrectionType) {
        textField?.autocorrectionType = autocorrectionType
    }
  
    open var autocapitalizationType: UITextAutocapitalizationType = .none {
        didSet {
            didSetAutocapitalizationType(oldValue: oldValue)
        }
    }
    open func didSetAutocapitalizationType(oldValue: UITextAutocapitalizationType) {
        textField?.autocapitalizationType = autocapitalizationType
    }
    
    open var spellCheckingType: UITextSpellCheckingType = .default {
        didSet {
            didSetSpellCheckingType(oldValue: oldValue)
        }
    }
    open func didSetSpellCheckingType(oldValue: UITextSpellCheckingType) {
        textField?.spellCheckingType = spellCheckingType
    }
  
    open var returnKeyType: UIReturnKeyType = .default {
        didSet {
            didSetReturnKeyType(oldValue: oldValue)
        }
    }
    open func didSetReturnKeyType(oldValue: UIReturnKeyType) {
        textField?.returnKeyType = returnKeyType
    }
    
    // MARK: - Editing
    
    open var shouldBeginEditing: Bool = true {
        didSet {
            didSetShouldBeginEditing(oldValue: oldValue)
        }
    }
    open func didSetShouldBeginEditing(oldValue: Bool) {
        
    }
    
    open var shouldEndEditing: Bool = true {
        didSet {
            didSetShouldEndEditing(oldValue: oldValue)
        }
    }
    open func didSetShouldEndEditing(oldValue: Bool) {
        
    }
      
    open var didChangeText: (() -> Void)?
  
    open var didTapReturnKey: (() -> Bool)?
  
    open var didBeginEditing: (() -> Void)?
    
    open var didEndEditing: (() -> Void)?
    
    open var didEndEditingReason: ((UITextField.DidEndEditingReason) -> Void)?
    
    open func clean() {
        textField?.text = nil
    }
    
    // MARK: - Actions
  
    open override func controlEditingChangedEventAction() {
        text = textField?.text
    }
  
    // MARK: - UITextFieldDelegate
    
    private class UITextFieldDelegateProxy: NSObject, UITextFieldDelegate {
        weak var delegate: AUIEmptyTextFieldController?
              
        func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            return delegate?.textFieldShouldBeginEditing() ?? false
        }
      
        func textFieldDidBeginEditing(_ textField: UITextField) {
            delegate?.textFieldDidBeginEditing()
        }
      
        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            return delegate?.textFieldShouldEndEditing() ?? true
        }
      
        func textFieldDidEndEditing(_ textField: UITextField) {
            delegate?.textFieldDidEndEditing()
        }
      
        func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
            delegate?.textFieldDidEndEditing(reason: reason)
        }
      
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            return delegate?.textField(shouldChangeCharactersIn: range, replacementString: string) ?? false
        }
      
        func textFieldShouldClear(_ textField: UITextField) -> Bool {
            return delegate?.textFieldShouldClear() ?? true
        }
      
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            return delegate?.textFieldShouldReturn() ?? true
        }
    }
    
    private let textFieldDelegate = UITextFieldDelegateProxy()
  
    open func textFieldShouldBeginEditing() -> Bool {
        return shouldBeginEditing
    }
  
    open func textFieldDidBeginEditing() {
        guard let didBeginEditing = didBeginEditing else { return }
        didBeginEditing()
    }
  
    open func textFieldShouldEndEditing() -> Bool {
        return shouldEndEditing
    }
  
    open func textFieldDidEndEditing() {
        guard let didEndEditing = didEndEditing else { return }
        didEndEditing()
    }
  
    open func textFieldDidEndEditing(reason: UITextField.DidEndEditingReason) {
        guard let didEndEditingReason = didEndEditingReason else { return }
        didEndEditingReason(reason)
    }
  
    open func textField(shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
  
    open func textFieldShouldClear() -> Bool {
        return true
    }
  
    open func textFieldShouldReturn() -> Bool {
        guard let didTapReturnKey = didTapReturnKey else { return true }
        return didTapReturnKey()
    }
  
    // MARK: - KeyValueObserverProxyDelegate
    
    private class KeyValueObserverProxy: NSObject {
        
        weak var delegate: AUIEmptyTextFieldController?
      
        override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
            if keyPath == UITextFieldTextPropertyKey, let textField = object as? UITextField { delegate?.textFieldDidChangeText(textField) }
        }
      
    }
    
    private let keyValueObserverProxy = KeyValueObserverProxy()
  
    open func textFieldDidChangeText(_ textField: UITextField) {
        text = textField.text
    }

}
