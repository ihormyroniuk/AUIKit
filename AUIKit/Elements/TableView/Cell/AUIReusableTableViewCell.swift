//
//  AUIReusableTableViewCell.swift
//  AUIKit
//
//  Created by branderstudio on 4/26/19.
//

import Foundation

open class AUIReusableTableViewCell: AUITableViewCellView, AUIViewContainerable, AUIConfigurableView {
  
  private var createViewBlock: (() -> UIView)?
  private(set) public var containerView: UIView?
  
  // MARK: - Public
  
  open func setCellCreateViewBlock(_ block: @escaping () -> UIView) {
    createViewBlock = block
  }
  
  open func setupUI(insets: UIEdgeInsets = .zero, height: CGFloat? = nil) {
    initContainerViewIfNeeded(insets: insets, height: height)
  }
  
  // MARK: - Private
  
  private func initContainerViewIfNeeded(insets: UIEdgeInsets, height: CGFloat?) {
    if containerView == nil {
      guard let createViewBlock = createViewBlock else { return }
      let createdContainerView = createViewBlock()
      containerView = createdContainerView
      contentView.addSubview(createdContainerView)
      placeContainerView(insets: insets, height: height)
    }
  }
  
  private func placeContainerView(insets: UIEdgeInsets, height: CGFloat?) {
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
  }
  
  private func needSetupUI() -> Bool {
    return containerView == nil
  }
  
  // MARK: - AUIConfigurableView
  
  open func setupUIIfNeeded() {
    if needSetupUI() {
      setupUI()
    }
  }
}
