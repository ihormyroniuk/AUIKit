//
//  ScrollViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 9/7/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultScrollViewController: AUIDefaultViewController, AUIScrollViewController {

  // MARK: View
  
  open var scrollView: UIScrollView? {
    set { view = newValue }
    get { return view as? UIScrollView }
  }
  
  open override func setupView() {
    super.setupView()
    scrollView?.keyboardDismissMode = keyboardDismissMode
  }
  
  // MARK: States
  
  open var keyboardDismissMode: UIScrollView.KeyboardDismissMode = .none {
    didSet { didSetKeyboardDismissMode() }
  }
  open var isScrollEnabled: Bool = true {
    didSet { scrollView?.isScrollEnabled = isScrollEnabled }
  }
  open func didSetKeyboardDismissMode() {
    scrollView?.keyboardDismissMode = keyboardDismissMode
  }
  
}
