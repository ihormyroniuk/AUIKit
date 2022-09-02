import UIKit

open class AUIEmptyTextViewController: AUIEmptyScrollViewController, AUITextViewController {
  
    // MARK: - Setup
  
    open override func setup() {
        super.setup()
        textFieldDelegate.delegate = self
    }
  
    // MARK: - TextView
  
    open var textView: UITextView? {
        set { view = newValue }
        get { return view as? UITextView }
    }
  
    open override func setupScrollView() {
        super.setupScrollView()
        setupTextView()
    }
  
    open func setupTextView() {
        textView?.delegate = textFieldDelegate
        inputAccessoryViewController?.view = textView?.inputAccessoryView
        inputViewController?.view = textView?.inputView
        textView?.keyboardType = keyboardType
        textView?.returnKeyType = returnKeyType
        textView?.autocorrectionType = autocorrectionType
        textView?.autocapitalizationType = autocapitalizationType
        textView?.isSecureTextEntry = isSecureTextEntry
    }
  
    open override func unsetupScrollView() {
        super.unsetupScrollView()
        unsetupTextField()
    }
  
    func unsetupTextField() {
        textView?.delegate = nil
        inputAccessoryViewController?.view = nil
        inputViewController?.view = nil
    }
    
    // MARK: Input Accessory View Controller
  
    open var inputAccessoryViewController: AUIViewController? {
        didSet { didSetInputAccessoryViewController(oldValue: oldValue) }
    }
    open func didSetInputAccessoryViewController(oldValue: AUIViewController?) {
        oldValue?.view = nil
        inputAccessoryViewController?.view = textView?.inputAccessoryView
    }
  
    // MARK: Input View Controller
  
    open var inputViewController: AUIViewController? {
        didSet { didSetInputViewController(oldValue: oldValue) }
    }
    open func didSetInputViewController(oldValue: AUIViewController?) {
        oldValue?.view = nil
        inputViewController?.view = textView?.inputView
    }

    // MARK: - Text
  
    open var text: String! {
        didSet {
            didSetText(oldValue: oldValue)
        }
    }
    open func didSetText(oldValue: String!) {
        if oldValue != text {
            textView?.text = text
            if let didChangeText = didChangeText {
                didChangeText()
            }
        }
    }
    
    // MARK: - Keyboard
  
    open var keyboardType: UIKeyboardType = .default {
        didSet { didSetKeyboardType(oldValue: oldValue) }
    }
    open func didSetKeyboardType(oldValue: UIKeyboardType) {
        textView?.keyboardType = keyboardType
    }
  
    open var returnKeyType: UIReturnKeyType = .default {
        didSet { didSetReturnKeyType(oldValue: oldValue) }
    }
    open func didSetReturnKeyType(oldValue: UIReturnKeyType) {
        textView?.returnKeyType = returnKeyType
    }
  
    open var autocorrectionType: UITextAutocorrectionType = .default {
        didSet { didSetAutocorrectionType(oldValue: oldValue) }
    }
    open func didSetAutocorrectionType(oldValue: UITextAutocorrectionType) {
        textView?.autocorrectionType = autocorrectionType
    }
  
    open var autocapitalizationType: UITextAutocapitalizationType = .none {
        didSet { didSetAutocapitalizationType(oldValue: oldValue) }
    }
    open func didSetAutocapitalizationType(oldValue: UITextAutocapitalizationType) {
        textView?.autocapitalizationType = autocapitalizationType
    }
    
    // MARK: - Security
  
    open var isSecureTextEntry: Bool = false {
        didSet { didSetIsSecureTextEntry(oldValue: oldValue) }
    }
    open func didSetIsSecureTextEntry(oldValue: Bool) {
        textView?.isSecureTextEntry = isSecureTextEntry
    }
    
    // MARK: - Actions
    
    open var didChangeText: (() -> Void)?
      
    open var didBeginEditing: (() -> Void)?
      
    open var didEndEditing: (() -> Void)?
  
    // MARK: UITextFieldDelegateProxyDelegate
    
    private let textFieldDelegate = UITextViewDelegateProxy()
  
    open func textViewShouldBeginEditing() -> Bool {
        return true
    }
  
    open func textViewDidBeginEditing() {
        guard let didBeginEditing = didBeginEditing else { return }
        didBeginEditing()
    }
  
    open func textViewShouldEndEditing() -> Bool {
        return true
    }
  
    open func textViewDidEndEditing() {
        guard let didEndEditing = didEndEditing else { return }
        didEndEditing()
    }
  
    open func textView(shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
  
    open func textViewDidChange() {
        if let textView = textView {
            text = textView.text
        }
    }
  
    open func textViewDidChangeSelection() {
    
    }
  
    open func textView(shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        return true
    }
  
    open func textView(shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        return true
    }
  
}

private class UITextViewDelegateProxy: NSObject, UITextViewDelegate {
    weak var delegate: AUIEmptyTextViewController?
  
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return delegate?.textViewShouldBeginEditing() ?? true
    }
  
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return delegate?.textViewShouldEndEditing() ?? true
    }
  
    func textViewDidBeginEditing(_ textView: UITextView) {
        delegate?.textViewDidBeginEditing()
    }
  
    func textViewDidEndEditing(_ textView: UITextView) {
        delegate?.textViewDidEndEditing()
    }
  
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return delegate?.textView(shouldChangeTextIn: range, replacementText: text) ?? true
    }
  
    func textViewDidChange(_ textView: UITextView) {
        delegate?.textViewDidChange()
    }
  
    func textViewDidChangeSelection(_ textView: UITextView) {
        delegate?.textViewDidChangeSelection()
    }
  
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        return delegate?.textView(shouldInteractWith: URL, in: characterRange, interaction: interaction) ?? true
    }
  
    func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        return delegate?.textView(shouldInteractWith: textAttachment, in: characterRange, interaction: interaction) ?? true
    }
  
}
