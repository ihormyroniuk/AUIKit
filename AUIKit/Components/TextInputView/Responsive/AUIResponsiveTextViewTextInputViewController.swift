import UIKit

open class AUIResponsiveTextViewTextInputViewController: AUIEmptyTextViewTextInputViewController {

    // MARK: - AUIResponsiveTextInputView
  
    open var responsiveTextInputView: AUIResponsiveTextInputView? {
        get { return view as? AUIResponsiveTextInputView }
        set { view = newValue }
    }
  
    // MARK: - Actions
  
    open override func textViewControllerDidChangeText() {
        super.textViewControllerDidChangeText()
        guard let textViewController = textViewController else { return }
        if textViewController.text?.isEmpty == false {
            responsiveTextInputView?.responsiveTextInputViewDidBecomeNonEmpty(animated: textViewController.isFirstResponder)
        } else {
            responsiveTextInputView?.responsiveTextInputViewDidBecomeEmpty(animated: textViewController.isFirstResponder)
        }
        if !textViewController.isFirstResponder {
            if self.textViewController?.text?.isEmpty == false {
                responsiveTextInputView?.responsiveTextInputViewDidEndEditingNonempty(animated: false)
            } else {
                responsiveTextInputView?.responsiveTextInputViewDidEndEditingEmpty(animated: false)
            }
        }
    }
  
    open override func textViewControllerDidBeginEditing() {
        super.textViewControllerDidBeginEditing()
        if self.textViewController?.text?.isEmpty == false {
            responsiveTextInputView?.responsiveTextInputViewDidBeginEditingNonempty(animated: true)
        } else {
            responsiveTextInputView?.responsiveTextInputViewDidBeginEditingEmpty(animated: true)
        }
    }
  
    open override func textViewControllerDidEndEditing() {
        super.textViewControllerDidEndEditing()
        if self.textViewController?.text?.isEmpty == false {
            responsiveTextInputView?.responsiveTextInputViewDidEndEditingNonempty(animated: true)
        } else {
            responsiveTextInputView?.responsiveTextInputViewDidEndEditingEmpty(animated: true)
        }
    }

}
