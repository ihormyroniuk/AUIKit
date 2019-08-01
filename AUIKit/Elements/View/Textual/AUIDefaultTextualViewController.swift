//
//  AUIDefaultTextualViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 7/31/19.
//

import Foundation

open class AUIDefaultTextualViewController: AUIDefaultViewController, AUITextualViewController {
  
  open var text: String? {
    didSet {
      didSetText(oldValue)
    }
  }
  open func didSetText(_ oldValue: String?) {
    textualView?.textualViewSetText(text)
  }
  
  open var textualView: AUITextualView? {
    get {
      return view as? AUITextualView
    }
    set {
      view = newValue
    }
  }
  
  open override func setupView() {
    super.setupView()
    textualView?.textualViewSetText(text)
  }
  
}
