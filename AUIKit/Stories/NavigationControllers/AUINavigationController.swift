//
//  AUINavigationController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 4/9/19.
//

import Foundation

open class AUINavigationController: UINavigationController, UIGestureRecognizerDelegate {
  
  // MARK: Initializer
  
  public init() {
    super.init(nibName: nil, bundle: nil)
    setup()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  open func setup() {
    
  }
  
  // MARK: Events
  
  open override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    interactivePopGestureRecognizer?.isEnabled = true
    interactivePopGestureRecognizer?.delegate = self
  }
  
  public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    return viewControllers.count > 1
  }
  
}
