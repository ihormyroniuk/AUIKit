import UIKit

open class AUIEmptyScrollViewController: AUIEmptyViewController, AUIScrollViewController {
    
    // MARK: - Setup
  
    open override func setup() {
        super.setup()
        scrollViewDelegateProxy.emptyScrollViewController = self
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
        scrollView?.delegate = scrollViewDelegateProxy
    }
  
    open override func unsetupView() {
        super.unsetupView()
        unsetupScrollView()
    }
  
    open func unsetupScrollView() {
        scrollView?.delegate = nil
    }
  
    // MARK: - Keyboard
  
    open var keyboardDismissMode: UIScrollView.KeyboardDismissMode = .none {
        didSet { didSetKeyboardDismissMode(oldValue: oldValue) }
    }
    open func didSetKeyboardDismissMode(oldValue: UIScrollView.KeyboardDismissMode) {
        scrollView?.keyboardDismissMode = keyboardDismissMode
    }
    
    // MARK: - Scroll
    
    open var isScrollEnabled: Bool = true {
        didSet { didSetIsScrollEnabled(oldValue: oldValue) }
    }
    open func didSetIsScrollEnabled(oldValue: Bool) {
        scrollView?.isScrollEnabled = isScrollEnabled
    }
    
    open var didScroll: (() -> Void)?
    
    open var didEndScrollingAnimation: (() -> Void)?
    
    open var willBeginDragging: (() -> Void)?
    
    open var didEndDragging: ((Bool) -> Void)?
    
    open var didEndDecelerating: (() -> Void)?
    
    // MARK: - AUIScrollViewDelegateProxy
    
    private class AUIScrollViewDelegateProxy: NSObject, UIScrollViewDelegate {
          
        weak var emptyScrollViewController: AUIEmptyScrollViewController?
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            emptyScrollViewController?.scrollViewDidScroll()
        }
        
        func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
            emptyScrollViewController?.scrollViewDidEndScrollingAnimation()
        }
        
        func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            emptyScrollViewController?.scrollViewWillBeginDragging()
        }
        
        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            emptyScrollViewController?.scrollViewDidEndDragging(decelerate: decelerate)
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            emptyScrollViewController?.scrollViewDidEndDecelerating()
        }
        
    }
    
    private let scrollViewDelegateProxy = AUIScrollViewDelegateProxy()
      
    open func scrollViewDidScroll() {
        guard let didScroll = didScroll else { return }
        didScroll()
    }
        
    open func scrollViewDidEndScrollingAnimation() {
        guard let didEndScrollingAnimation = didEndScrollingAnimation else { return }
        didEndScrollingAnimation()
    }
        
    open func scrollViewWillBeginDragging() {
        guard let willBeginDragging = willBeginDragging else { return }
        willBeginDragging()
    }
        
    open func scrollViewDidEndDragging(decelerate: Bool) {
        guard let didEndDragging = didEndDragging else { return }
        didEndDragging(decelerate)
    }
        
    open func scrollViewDidEndDecelerating() {
        guard let didEndDecelerating = didEndDecelerating else { return }
        didEndDecelerating()
    }
    
}
