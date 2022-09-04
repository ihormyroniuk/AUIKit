import UIKit

open class AUIResponsiveTextFieldTextInputViewController: AUIEmptyTextFieldTextInputViewController {
  
    // MARK: - AUIResponsiveTextInputView
  
    open var responsiveTextInputView: AUIResponsiveTextInputView? {
        get { return view as? AUIResponsiveTextInputView }
        set { view = newValue }
    }
  
    // MARK: - Actions
  
    open override func textFieldControllerDidChangeText() {
        super.textFieldControllerDidChangeText()
        guard let textFieldController = textFieldController else { return }
        if textFieldController.text?.isEmpty == false {
            responsiveTextInputView?.responsiveTextInputViewDidBecomeNonEmpty(animated: textFieldController.isFirstResponder)
        } else {
            responsiveTextInputView?.responsiveTextInputViewDidBecomeEmpty(animated: textFieldController.isFirstResponder)
        }
        if !textFieldController.isFirstResponder {
            if textFieldController.text?.isEmpty == false {
                responsiveTextInputView?.responsiveTextInputViewDidEndEditingNonempty(animated: false)
            } else {
                responsiveTextInputView?.responsiveTextInputViewDidEndEditingEmpty(animated: false)
            }
        }
    }
  
    open override func textFieldControllerDidBeginEditing() {
        super.textFieldControllerDidBeginEditing()
        guard let textFieldController = textFieldController else { return }
        if textFieldController.text?.isEmpty == false {
            responsiveTextInputView?.responsiveTextInputViewDidBeginEditingNonempty(animated: true)
        } else {
            responsiveTextInputView?.responsiveTextInputViewDidBeginEditingEmpty(animated: true)
        }
    }
  
    open override func textFieldControllerDidEndEditing() {
        super.textFieldControllerDidEndEditing()
        if self.textFieldController?.text?.isEmpty == false {
            responsiveTextInputView?.responsiveTextInputViewDidEndEditingNonempty(animated: true)
        } else {
            responsiveTextInputView?.responsiveTextInputViewDidEndEditingEmpty(animated: true)
        }
    }
  
    open override func textFieldControllerDidEndEditingReason(_ reason: UITextField.DidEndEditingReason) {
        super.textFieldControllerDidEndEditingReason(reason)
        if self.textFieldController?.text?.isEmpty == false {
            responsiveTextInputView?.responsiveTextInputViewDidEndEditingNonempty(animated: true)
        } else {
            responsiveTextInputView?.responsiveTextInputViewDidEndEditingEmpty(animated: true)
        }
    }
  
}
