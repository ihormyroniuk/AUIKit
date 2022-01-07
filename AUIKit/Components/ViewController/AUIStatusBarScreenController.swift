//
//  AUIStatusBarScreenController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 04.08.2020.
//

import UIKit

open class AUIStatusBarScreenController: AUIEmptyScreenController {
  
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


