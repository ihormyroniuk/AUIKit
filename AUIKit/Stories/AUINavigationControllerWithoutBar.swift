//
//  AUINavigationControllerWithoutBar.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/12/19.
//

import Foundation

open class AUINavigationControllerWithoutBar: UINavigationController, UIGestureRecognizerDelegate {
  
  // MARK: Initializer
  
  init() {
    super.init(nibName: nil, bundle: nil)
    setup()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  func setup() {
    setNavigationBarHidden(true, animated: false)
  }
  
  // MARK: Events
  
  open override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    interactivePopGestureRecognizer?.isEnabled = true
    interactivePopGestureRecognizer?.delegate = self
  }
  
}
