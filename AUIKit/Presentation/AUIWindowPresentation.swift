//
//  AUIDefaultPresentation.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/26/19.
//

import UIKit

open class AUIWindowPresentation: AUIEmptyPresentation {
  
    // MARK: Elements
  
    public let window: UIWindow
  
    // MARK: Initializer
  
    public init(window: UIWindow) {
        self.window = window
        super.init()
    }
  
}
