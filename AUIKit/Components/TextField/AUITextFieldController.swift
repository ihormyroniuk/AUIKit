import UIKit

public protocol AUITextFieldController: AUIControlController {
    
    // MARK: - TextField
  
    var textField: UITextField? { get set }
    
    // MARK: - Input View Controller
  
    var inputViewController: AUIViewController? { get set }
    
    // MARK: - Input Accessory View Controller
  
    var inputAccessoryViewController: AUIViewController? { get set }

    // MARK: - Text
  
    var text: String? { get set }
    
    // MARK: - Placeholder
    
    var placeholder: String? { get set }
    
    // MARK: - Security
    
    var isSecureTextEntry: Bool { get set }
    
    // MARK: - Keyboard
    
    var keyboardType: UIKeyboardType { get set }
    
    var autocorrectionType: UITextAutocorrectionType { get set }
    
    var autocapitalizationType: UITextAutocapitalizationType { get set }
    
    var returnKeyType: UIReturnKeyType { get set }
    
    // MARK: - Editing
    
    var shouldBeginEditing: Bool { get set }
    
    var shouldEndEditing: Bool { get set }
    
    // MARK: - Actions
  
    var didChangeText: (() -> Void)? { get set }

    var didTapReturnKey: (() -> Bool)? { get set }
    
    var didBeginEditing: (() -> Void)? { get set }
    
    var didEndEditing: (() -> Void)? { get set }
    
    var didEndEditingReason: ((UITextField.DidEndEditingReason) -> Void)? { get set }
  
}
