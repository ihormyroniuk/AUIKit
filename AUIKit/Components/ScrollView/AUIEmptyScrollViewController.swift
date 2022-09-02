import UIKit

open class AUIEmptyScrollViewController: AUIEmptyViewController, AUIScrollViewController {
    
    // MARK: - Setup
  
    open override func setup() {
        super.setup()
        emptyScrollViewDelegateProxy.emptyScrollViewController = self
    }

    // MARK: - UIScrollView
  
    open var scrollView: UIScrollView? {
        set { view = newValue }
        get { return view as? UIScrollView }
    }
  
    open override func setupView() {
        super.setupView()
        setupScrollView()
    }
  
    open func setupScrollView() {
        scrollView?.keyboardDismissMode = keyboardDismissMode
        scrollView?.isScrollEnabled = isScrollEnabled
        scrollView?.delegate = emptyScrollViewDelegateProxy
    }
  
    open override func unsetupView() {
        super.unsetupView()
        unsetupScrollView()
    }
  
    open func unsetupScrollView() {
        scrollView?.delegate = nil
    }
    
    // MARK: - Scroll
    
    open var isScrollEnabled: Bool = true {
        didSet { didSetIsScrollEnabled(oldValue: oldValue) }
    }
    open func didSetIsScrollEnabled(oldValue: Bool) {
        scrollView?.isScrollEnabled = isScrollEnabled
    }
  
    // MARK: - Keyboard
  
    open var keyboardDismissMode: UIScrollView.KeyboardDismissMode = .none {
        didSet { didSetKeyboardDismissMode(oldValue: oldValue) }
    }
    open func didSetKeyboardDismissMode(oldValue: UIScrollView.KeyboardDismissMode) {
        scrollView?.keyboardDismissMode = keyboardDismissMode
    }
    
    // MARK: - UIScrollViewDelegate
  
    private let emptyScrollViewDelegateProxy = AUIScrollViewDelegateProxy()
    
    open var scrollViewDidScrollClosure: (() -> Void)?
    open var scrollViewDidEndScrollingAnimationClosure: (() -> Void)?
    
    open var scrollViewDidEndDraggingClosure: ((Bool) -> Void)?
    open var scrollViewWillBeginDraggingClosure: (() -> Void)?
    open var scrollViewDidEndDeceleratingClosure: (() -> Void)?
  
}

class AUIScrollViewDelegateProxy: NSObject, UIScrollViewDelegate {
      
    weak var emptyScrollViewController: AUIEmptyScrollViewController?
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        emptyScrollViewController?.scrollViewDidScrollClosure?()
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        emptyScrollViewController?.scrollViewDidEndScrollingAnimationClosure?()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        emptyScrollViewController?.scrollViewWillBeginDraggingClosure?()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        emptyScrollViewController?.scrollViewDidEndDraggingClosure?(decelerate)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        emptyScrollViewController?.scrollViewDidEndDeceleratingClosure?()
    }
    
}
