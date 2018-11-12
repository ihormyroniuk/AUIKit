//
//  AUIContainerPageController.swift
//  Level
//
//  Created by Ihor Myroniuk on 10/26/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultPageController: AUIPageController {
  
  open let viewController: AUIViewController
  open let view: () -> UIView
  
  // MARK: Initializer
  
  public init(viewController: AUIViewController, view: @escaping () -> UIView) {
    self.viewController = viewController
    self.view = view
  }
  
  // MARK: AUIPageController
  
  open var pageViewController: UIViewController {
    return UIViewController()
  }
  
}
