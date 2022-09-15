import UIKit

public protocol AUIScrollViewController: AUIViewController {
  
    // MARK: - UIScrollView
  
    var scrollView: UIScrollView? { get set }
      
    // MARK: - Keyboard
  
    var keyboardDismissMode: UIScrollView.KeyboardDismissMode { get set }
    
    // MARK: - Scroll
    
    var isScrollEnabled: Bool { get set }
    
    var didScroll: (() -> Void)? { get set }
        
    var didEndScrollingAnimation: (() -> Void)? { get set }
        
    var willBeginDragging: (() -> Void)? { get set }
        
    var didEndDragging: ((Bool) -> Void)? { get set }
        
    var didEndDecelerating: (() -> Void)? { get set }
      
}
