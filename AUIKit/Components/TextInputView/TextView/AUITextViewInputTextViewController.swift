import UIKit

public protocol AUITextViewInputTextViewController: AUIViewController {
    
    var didChangeText: (() -> Void)? { get set }
    
    var didBeginEditing: (() -> Void)? { get set }
    
    var didEndEditing: (() -> Void)? { get set }

    // MARK: TextFieldInputView
    
    var textViewInputView: AUITextViewTextInputView? { get set }
    
    // MARK: Subview
  
    var textViewController: AUITextViewController? { get set }
  
}
