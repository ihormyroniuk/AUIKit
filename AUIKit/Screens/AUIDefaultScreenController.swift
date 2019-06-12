//
//  AUIScreenController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 11/12/18.
//

import UIKit

open class AUIDefaultScreenController: UIViewController, AUIScreenController {
  
  // MARK: Initializers
  
  public init(view: UIView) {
    screenView = view
    super.init(nibName: nil, bundle: nil)
    setup()
  }
  
  @available(*, unavailable)
  public convenience required init?(coder aDecoder: NSCoder) { return nil }
  
  // MARK: Setup
  
  open func setup() {
    
  }
  
  // MARK: Life Cycle
  
  private let screenView: UIView
  open override func loadView() {
    self.view = screenView
  }
  
  open var isAppeared = false
  open override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    isAppeared = true
    didSetStatusBarStyle()
  }
  
  open override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    isAppeared = false
  }
  
  open override var preferredStatusBarStyle: UIStatusBarStyle { return statusBarStyle }
  open var statusBarStyle: UIStatusBarStyle = .default {
    didSet { didSetStatusBarStyle() }
  }
  open func didSetStatusBarStyle() {
    guard isAppeared == true else { return }
    navigationController?.navigationBar.barStyle = (statusBarStyle == .default) ? .black : .default
    setNeedsStatusBarAppearanceUpdate()
  }
  
}

