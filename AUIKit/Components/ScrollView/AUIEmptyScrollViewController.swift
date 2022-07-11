//
//  ScrollViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 9/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIEmptyScrollViewController: AUIEmptyViewController, AUIScrollViewController {
    
    // MARK: Proxy
  
    private let emptyScrollViewDelegateProxy = AUIEmptyScrollViewDelegateProxy()
    
    // MARK: Setup
  
    open override func setup() {
        super.setup()
        emptyScrollViewDelegateProxy.emptyScrollViewController = self
    }

    // MARK: View
  
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
  
    // MARK: States
  
    open var keyboardDismissMode: UIScrollView.KeyboardDismissMode = .none {
        didSet { didSetKeyboardDismissMode() }
    }
    open func didSetKeyboardDismissMode() {
        scrollView?.keyboardDismissMode = keyboardDismissMode
    }
    
    open var isScrollEnabled: Bool = true {
        didSet { scrollView?.isScrollEnabled = isScrollEnabled }
    }
    
    open var scrollViewDidScrollClosure: (() -> Void)?
    open var scrollViewDidEndScrollingAnimationClosure: (() -> Void)?
    
    open var scrollViewDidEndDraggingClosure: ((Bool) -> Void)?
    open var scrollViewWillBeginDraggingClosure: (() -> Void)?
    open var scrollViewDidEndDeceleratingClosure: (() -> Void)?
  
}

class AUIEmptyScrollViewDelegateProxy: NSObject, UIScrollViewDelegate {
      
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
