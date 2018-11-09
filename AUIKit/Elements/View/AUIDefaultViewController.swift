//
//  ViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/17/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultViewController: AUIViewController, Hashable {

  // MARK: Elements
  
  private var _view: UIView?
  public var view: UIView? {
    set {
      if newValue != _view {
        unsetupView()
        _view = newValue
        setupView()
      }
    }
    get {
      return _view
    }
  }
  
  // MARK: Initializer
  
  init() {
    setup()
  }
  
  // MARK: Setup
  
  open func setup() {
    
  }
  
  open func setupView() {
    view?.isUserInteractionEnabled = isUserInteractionEnabled
  }
  
  open func unsetupView() {

  }
  
  // MARK: State
  
  open var isUserInteractionEnabled = true {
    didSet { didSetIsUserInteractionEnabled(oldValue: oldValue) }
  }
  open func didSetIsUserInteractionEnabled(oldValue: Bool) {
    view?.isUserInteractionEnabled = isUserInteractionEnabled
  }
  
  open func becomeFirstResponder() {
    view?.becomeFirstResponder()
  }
  
  open func resignFirstResponder() {
    view?.resignFirstResponder()
  }
  
  // MARK: Hashable, Equatable
  
  open var hashValue: Int = Int(arc4random())
  
  public static func == (lhs: AUIDefaultViewController, rhs: AUIDefaultViewController) -> Bool {
    return lhs === rhs
  }
  
}
