//
//  AUIContainerPageController.swift
//  Level
//
//  Created by Ihor Myroniuk on 10/26/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIViewPageViewController: AUIPageController {
    public func didSelect() {
        
    }
    
    
    // MARK: Components
    
    private let view: UIView
  
    // MARK: Initializer
  
    public init(view: UIView) {
        self.view = view
    }
  
    public var viewController: UIViewController {
        class ViewController: UIViewController {
            init(view: UIView) {
                super.init(nibName: nil, bundle: nil)
                self.view = view
            }
            
            required init?(coder: NSCoder) { return nil }
        }
        return ViewController(view: view)
    }
}

open class AUIDefaultPageController: AUIPageController {
    public func didSelect() {
        
    }
    
  
  public let viewController2: AUIViewController
  public let view: () -> UIView
  
  // MARK: Initializer
  
  public init(viewController: AUIViewController, view: @escaping () -> UIView) {
    self.viewController2 = viewController
    self.view = view
  }
  
  public var viewController: UIViewController {
    return AUIContainerPageViewController(viewController: viewController2, view: view())
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

