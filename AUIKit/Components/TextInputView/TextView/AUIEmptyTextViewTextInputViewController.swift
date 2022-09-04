import UIKit

open class AUIEmptyTextViewTextInputViewController: AUIEmptyViewController, AUITextViewInputTextViewController  {
  
    // MARK: - AUITextViewTextInputView
    
    open var textViewTextInputView: AUITextViewTextInputView? {
        set { view = newValue }
        get { return view as? AUITextViewTextInputView }
    }
    
    open override func setupView() {
        super.setupView()
        setupTextViewInputView()
    }
    
    open func setupTextViewInputView() {
        textViewController?.textView = textViewTextInputView?.textView
    }
    
    open override func unsetupView() {
        super.unsetupView()
        unsetupTextViewInputView()    }
    
    open func unsetupTextViewInputView() {
        textViewController?.textView = nil
    }
    
    // MARK: - AUITextViewController
  
    open var textViewController: AUITextViewController? {
        didSet {
            didSetTextViewController(oldValue)
        }
    }
    open func didSetTextViewController(_ oldValue: AUITextViewController?) {
        guard textViewController !== oldValue else { return }
        oldValue?.didChangeText = nil
        oldValue?.didBeginEditing = nil
        oldValue?.didEndEditing = nil
        oldValue?.textView = nil
        textViewController?.didChangeText = { [weak self] in
            guard let self = self else { return }
            self.textViewControllerDidChangeText()
        }
        textViewController?.didBeginEditing = { [weak self] in
            guard let self = self else { return }
            self.textViewControllerDidBeginEditing()
        }
        textViewController?.didEndEditing = { [weak self] in
            guard let self = self else { return }
            self.textViewControllerDidEndEditing()
        }
        textViewController?.textView = textViewTextInputView?.textView
    }
    
    // MARK: - Events
    
    open var didChangeText: (() -> Void)?
    
    open var didBeginEditing: (() -> Void)?
    
    open var didEndEditing: (() -> Void)?
  
    // MARK: - Actions
  
    open func textViewControllerDidEndEditing() {
        guard let didEndEditing = didEndEditing else { return }
        didEndEditing()
    }

    open func textViewControllerDidChangeText() {
        guard let didChangeText = didChangeText else { return }
        didChangeText()
    }
  
    open func textViewControllerDidBeginEditing() {
        guard let didBeginEditing = didBeginEditing else { return }
        didBeginEditing()
    }
    
}
