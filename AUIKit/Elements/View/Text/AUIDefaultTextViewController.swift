//
//  AUIDefaultTextViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/11/19.
//

import UIKit

open class AUIDefaultTextViewController: AUIDefaultViewController, AUITextViewController {
  
  // MARK: View
  
  open var textView: (UIView & AUITextView)? {
    set { view = newValue }
    get { return view as? (UIView & AUITextView) }
  }
  
  open override func setupView() {
    super.setupView()
    textView?.textViewSetText(text)
  }
  
  // MARK: State
  
  open var text: String? {
    didSet { didSetText() }
  }
  open func didSetText() {
    textView?.textViewSetText(text)
  }
  
}
