//
//  AUIDefaultTextualViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 7/31/19.
//

import Foundation

open class AUIDefaultTextualViewController: AUIDefaultViewController, AUITextualViewController {
  
  public var text: String? {
    didSet {
      didSetText(oldValue)
    }
  }
  func didSetText(_ oldValue: String?) {
    textualView?.textualViewSetText(text)
  }
  
  var textualView: AUITextualView? {
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
