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
        setupStatusBarView()
    }
  
    open func setupStatusBarView() {
    
    }
  
    // MARK: Layout
  
    open override func layoutSubviews() {
        super.layoutSubviews()
        layoutStatusBarView()
    }
  
    open var statusBarFrame: CGRect {
        return UIApplication.shared.statusBarFrame
    }
    open func layoutStatusBarView() {
        statusBarView.frame = statusBarFrame
    }
  
}
