//
//  AUINavigationControllerWithoutBar.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/12/19.
//

import Foundation

class AUINavigationControllerWithoutBar: UINavigationController, UIGestureRecognizerDelegate {
  
  // MARK: Initializer
  
  init() {
    super.init(nibName: nil, bundle: nil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  func setup() {
    setNavigationBarHidden(true, animated: false)
  }
  
  // MARK: Events
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    interactivePopGestureRecognizer?.isEnabled = true
    interactivePopGestureRecognizer?.delegate = self
  }
  
}
