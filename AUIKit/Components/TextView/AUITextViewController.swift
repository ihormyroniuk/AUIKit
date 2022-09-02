import UIKit

public protocol AUITextViewController: AUIScrollViewController {
  
    // MARK: - UITextView
  
    var textView: UITextView? { get set }
    
    // MARK: Input Accessory View Controller
  
    var inputAccessoryViewController: AUIViewController? { get set }
  
    // MARK: Input View Controller
  
    var inputViewController: AUIViewController? { get set }

    // MARK: - Text
  
    var text: String! { get set }
    
    // MARK: - Keyboard
    
    var keyboardType: UIKeyboardType { get set }
    var returnKeyType: UIReturnKeyType { get set }
    var autocorrectionType: UITextAutocorrectionType { get set }
    var autocapitalizationType: UITextAutocapitalizationType { get set }
    
    // MARK: - Security
    
    var isSecureTextEntry: Bool { get set }
    
    // MARK: - Events
  
    var didChangeText: (() -> Void)? { get set }
    
    var didBeginEditing: (() -> Void)? { get set }
    
    var didEndEditing: (() -> Void)? { get set }
  
}
