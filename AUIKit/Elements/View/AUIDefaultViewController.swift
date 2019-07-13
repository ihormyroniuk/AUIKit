//
//  ViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/17/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultViewController: AUIViewController {

  // MARK: Initializer
  
  public init() {
    setup()
  }
  
  // MARK: Setup
  
  open func setup() {
    
  }
  
  // MARK: View
  
  private var _view: UIView?
  open var view: UIView? {
    set {
      if newValue !== _view {
        unsetupView()
        _view = newValue
        setupView()
      }
    }
    get {
      return _view
    }
  }
  
  open func setupView() {
    view?.isUserInteractionEnabled = isUserInteractionEnabled
  }
  
  open func unsetupView() {

  }
  
  // MARK: User Interaction
  
  open var isUserInteractionEnabled = true {
    didSet {
      didSetIsUserInteractionEnabled(oldValue: oldValue)
    }
  }
  open func didSetIsUserInteractionEnabled(oldValue: Bool) {
    view?.isUserInteractionEnabled = isUserInteractionEnabled
  }
  
  // MARK: First Responder
  
  open var isFirstResponder: Bool {
    return view?.isFirstResponder ?? false
  }
  
  open func becomeFirstResponder() {
    view?.becomeFirstResponder()
  }
  
  open func resignFirstResponder() {
    view?.resignFirstResponder()
  }
  
}
