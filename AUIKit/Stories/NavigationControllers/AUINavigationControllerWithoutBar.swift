//
//  AUINavigationControllerWithoutBar.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/12/19.
//

import UIKit

open class AUINavigationControllerWithoutBar: AUINavigationController {

  // MARK: Setup
  
  open override func setup() {
    setNavigationBarHidden(true, animated: false)
  }
  
}
