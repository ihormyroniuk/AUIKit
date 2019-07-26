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

private class AUIContainerPageViewController: UIViewController {
  
  // MARK: Controllers
  
  var viewController: AUIViewController
  
  // MARK: Initializers
  
  init(viewController: AUIViewController, view: UIView) {
    self.viewController = viewController
    super.init(nibName: nil, bundle: nil)
    self.view = view
    setup()
  }
  
  @available(*, unavailable)
  convenience required init?(coder aDecoder: NSCoder) { return nil }
  
  // MARK: Setup
  
  func setup() {
    viewController.view = view
  }
  
  deinit {
    viewController.view = nil
  }
}

