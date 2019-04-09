//
//  AUINavigationControllerWithoutBar.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/12/19.
//

import UIKit

open class AUINavigationControllerWithoutBar: AUINavigationController, UIGestureRecognizerDelegate {

  // MARK: Setup
  
  override func setup() {
    setNavigationBarHidden(true, animated: false)
  }
  
  // MARK: Events
  
  open override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    interactivePopGestureRecognizer?.isEnabled = true
    interactivePopGestureRecognizer?.delegate = self
  }
  
}
