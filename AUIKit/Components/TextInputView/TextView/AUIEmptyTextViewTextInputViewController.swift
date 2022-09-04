import UIKit

open class AUIEmptyTextViewTextInputViewController: AUIEmptyViewController, AUITextViewInputTextViewController  {
    
    open var didChangeText: (() -> Void)?
    
    open var didBeginEditing: (() -> Void)?
    
    open var didEndEditing: (() -> Void)?
  
    // MARK: TextFieldInputView
    
    open var textViewInputView: AUITextViewTextInputView? {
        set { view = newValue }
        get { return view as? AUITextViewTextInputView }
    }
    
    open override func setupView() {
        super.setupView()
        setupTextViewInputView()
    }
    
    open func setupTextViewInputView() {
        textViewController?.textView = textViewInputView?.textView
    }
    
    open override func unsetupView() {
        super.unsetupView()
        unsetupTextViewInputView()    }
    
    open func unsetupTextViewInputView() {
        textViewController?.textView = nil
    }
    
    // MARK: TextViewController
  
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
        textViewController?.textView = textViewInputView?.textView
    }
  
    // MARK: Events
  
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
