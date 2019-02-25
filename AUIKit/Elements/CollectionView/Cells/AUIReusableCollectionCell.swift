//
//  AUIReusableCollectionCell.swift
//  PocketDoc
//
//  Created by branderstudio on 10/30/18.
//  Copyright © 2018 BRANDER. All rights reserved.
//

import UIKit

open class AUIReusableCollectionCell: UICollectionViewCell, AUIViewContainer {
  
  // MARK: - Private variables
  
  private var createViewBlock: (() -> UIView)?
  public var containerView: UIView?
  
  // MARK: - AUIViewContainer
  
  public var view: UIView? {
    get { return containerView }
    set { containerView = newValue }
  }
  
  // MARK: - Life cycle
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    initConfigure()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initConfigure()
  }
  
  // MARK: - Init configure
  
  func initConfigure() {
    backgroundColor = .clear
  }
  
  // MARK: - Public
  
  open func setCellCreateViewBlock(_ block: @escaping () -> UIView) {
    createViewBlock = block
  }
  
  open func setupUI(insets: UIEdgeInsets = .zero, height: CGFloat? = nil, width: CGFloat? = nil) {
    initContainerViewIfNeeded()
    placeContainerView(insets: insets, height: height, width: width)
  }
  
  // MARK: - Private
  
  private func initContainerViewIfNeeded() {
    if containerView == nil {
      guard let createViewBlock = createViewBlock else { return }
      let createdContainerView = createViewBlock()
      containerView = createdContainerView
      contentView.addSubview(createdContainerView)
    }
  }
  
  private func placeContainerView(insets: UIEdgeInsets, height: CGFloat?, width: CGFloat?) {
    guard let containerView = containerView else { return }
    
    let leading = NSLayoutConstraint(
      item: containerView,
      attribute: .leading,
      relatedBy: .equal,
      toItem: contentView,
      attribute: .leading,
      multiplier: 1,
      constant: insets.left)
    
    let top = NSLayoutConstraint(
      item: containerView,
      attribute: .top,
      relatedBy: .equal,
      toItem: contentView,
      attribute: .top,
      multiplier: 1,
      constant: insets.top)
    
    let trailing = NSLayoutConstraint(
      item: containerView,
      attribute: .trailing,
      relatedBy: .equal,
      toItem: contentView,
      attribute: .trailing,
      multiplier: 1,
      constant: -insets.right)
    
    let bottom = NSLayoutConstraint(
      item: containerView,
      attribute: .bottom,
      relatedBy: .equal,
      toItem: contentView,
      attribute: .bottom,
      multiplier: 1,
      constant: -insets.bottom)
    
    containerView.translatesAutoresizingMaskIntoConstraints = false
    contentView.addConstraints([leading, top, bottom, trailing])
    
    if let height = height {
      let heightConstraint = NSLayoutConstraint(
        item: containerView,
        attribute: .height,
        relatedBy: .equal,
        toItem: nil,
        attribute: .notAnAttribute,
        multiplier: 1,
        constant: height)
      contentView.addConstraint(heightConstraint)
    }
    
    if let width = width {
      let widthConstraint = NSLayoutConstraint(
        item: containerView,
        attribute: .width,
        relatedBy: .equal,
        toItem: nil,
        attribute: .notAnAttribute,
        multiplier: 1,
        constant: width)
      contentView.addConstraint(widthConstraint)
    }
  }
  
  private func needSetupUI() -> Bool {
    return containerView == nil
  }
  
  open func setupUIIfNeeded() {
    if needSetupUI() {
      setupUI()
    }
  }
}
