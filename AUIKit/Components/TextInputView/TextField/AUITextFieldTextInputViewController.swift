import UIKit

public protocol AUITextFieldTextInputViewController: AUIViewController {
    
    // MARK: - AUITextFieldTextInputView
    
    var textFieldTextInputView: AUITextFieldTextInputView? { get set }
    
    // MARK: - AUITextFieldController
  
    var textFieldController: AUITextFieldController? { get set }
    
    // MARK: - Events
    
    var didChangeText: (() -> Void)? { get set }

    var didTapReturnKey: (() -> Bool)? { get set }
    
    var didBeginEditing: (() -> Void)? { get set }
    
    var didEndEditing: (() -> Void)? { get set }
    
    var didEndEditingReason: ((UITextField.DidEndEditingReason) -> Void)? { get set }
  
}
