import UIKit

public protocol AUIScrollViewController: AUIViewController {
  
    // MARK: - UIScrollView
  
    var scrollView: UIScrollView? { get set }
    
    // MARK: - Scroll
    
    var isScrollEnabled: Bool { get set }
  
    // MARK: - Keyboard
  
    var keyboardDismissMode: UIScrollView.KeyboardDismissMode { get set }
  
}
