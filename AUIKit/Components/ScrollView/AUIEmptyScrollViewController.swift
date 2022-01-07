//
//  ScrollViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 9/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIEmptyScrollViewController: AUIEmptyViewController, AUIScrollViewController {

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
    }
  
    open override func unsetupView() {
        super.unsetupView()
        unsetupScrollView()
    }
  
    open func unsetupScrollView() {
    
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
  
}
