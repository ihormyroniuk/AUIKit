//
//  AUIContainerPageController.swift
//  Level
//
//  Created by Ihor Myroniuk on 10/26/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultPageController: AUIPageViewController {
  
  public let viewController: AUIViewController
  public let view: () -> UIView
  
  // MARK: Initializer
  
  public init(viewController: AUIViewController, view: @escaping () -> UIView) {
    self.viewController = viewController
    self.view = view
  }
}
