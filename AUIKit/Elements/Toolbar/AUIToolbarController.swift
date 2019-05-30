//
//  AUIToolbarController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/6/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

public protocol AUIToolbarController: AUIViewController {
  
  // MARK: Toolbar
  
  var toolbar: UIToolbar? { get set }
  
}
