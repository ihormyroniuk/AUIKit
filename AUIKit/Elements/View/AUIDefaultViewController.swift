//
//  ViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/17/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public class AUIDefaultViewController: AUIViewController, Hashable {

  // MARK: Elements
  
  var _view: UIView?
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
  
  func setup() {
    
  }
  
  func setupView() {
    view?.isUserInteractionEnabled = isUserInteractionEnabled
  }
  
  func unsetupView() {

  }
  
  // MARK: State
  
  public var isUserInteractionEnabled = true {
    didSet { didSetIsUserInteractionEnabled(oldValue: oldValue) }
  }
  func didSetIsUserInteractionEnabled(oldValue: Bool) {
    view?.isUserInteractionEnabled = isUserInteractionEnabled
  }
  
  public func becomeFirstResponder() {
    view?.becomeFirstResponder()
  }
  
  public func resignFirstResponder() {
    view?.resignFirstResponder()
  }
  
  // MARK: Hashable, Equatable
  
  public var hashValue: Int = Int(arc4random())
  
  public static func == (lhs: AUIDefaultViewController, rhs: AUIDefaultViewController) -> Bool {
    return lhs === rhs
  }
  
}
