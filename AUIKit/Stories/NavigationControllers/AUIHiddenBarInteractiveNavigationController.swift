//
//  AUINavigationControllerWithoutBar.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/12/19.
//

import UIKit

open class AUIHiddenBarInteractiveNavigationController: AUIInteractiveNavigationController {

  // MARK: Setup
  
  open override func setup() {
    super.setup()
    setNavigationBarHidden(true, animated: false)
  }
  
}
