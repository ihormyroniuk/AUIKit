import UIKit

public protocol AUITextViewInputTextViewController: AUIViewController {

    // MARK: - AUITextViewTextInputView
    
    var textViewTextInputView: AUITextViewTextInputView? { get set }
    
    // MARK: - AUITextViewController
  
    var textViewController: AUITextViewController? { get set }
    
    // MARK: - Events
    
    var didChangeText: (() -> Void)? { get set }
    
    var didBeginEditing: (() -> Void)? { get set }
    
    var didEndEditing: (() -> Void)? { get set }
  
}
