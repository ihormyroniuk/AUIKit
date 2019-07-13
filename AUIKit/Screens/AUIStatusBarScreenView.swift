//
//  AUIStatusBarScreenView.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/26/19.
//

import UIKit

open class AUIStatusBarScreenView: AUIView {
  
  // MARK: Elements
  
  public let statusBarView: UIView
  
  // MARK: Initializer
  
  public init(frame: CGRect = .zero, statusBarView: UIView = UIView()) {
    self.statusBarView = statusBarView
    super.init(frame: frame)
  }
  
  // MARK: Setup
  
  open override func setup() {
    super.setup()
    addSubview(statusBarView)
  }
  
  // MARK: Layout
  
  open override func layout() {
    super.layout()
    layoutStatusBarView()
  }
  
  open var statusBarFrame: CGRect = UIApplication.shared.statusBarFrame
  open func layoutStatusBarView() {
    statusBarView.frame = statusBarFrame
  }
  
}
