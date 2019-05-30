//
//  AUIToolbarController.swift
//  Level
//
//  Created by Ihor Myroniuk on 10/1/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultToolbarController: AUIDefaultViewController, AUIToolbarController {

  // MARK: Toolbar
  
  open var toolbar: UIToolbar? {
    set { view = newValue }
    get { return view as? UIToolbar }
  }
  
}
