//
//  AUIViewControllerPageController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 7/29/19.
//

import UIKit

open class AUIViewControllerPageController: AUIPageViewController {
  
  public let viewController: UIViewController
  
  public init(viewController: UIViewController) {
    self.viewController = viewController
  }
  
}
