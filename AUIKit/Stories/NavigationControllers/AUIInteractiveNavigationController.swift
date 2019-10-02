//
//  AUINavigationController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 4/9/19.
//

import UIKit

open class AUIInteractiveNavigationController: AUINavigationController, UIGestureRecognizerDelegate {
  
  // MARK: Events
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    interactivePopGestureRecognizer?.isEnabled = true
    interactivePopGestureRecognizer?.delegate = self
  }
  
  public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    if interactivePopGestureRecognizer == gestureRecognizer {
      return viewControllers.count > 1
    }
    return true
  }
  
}
