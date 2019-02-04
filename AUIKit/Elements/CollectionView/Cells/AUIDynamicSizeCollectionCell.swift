//
//  AUIDynamicSizeCollectionCell.swift
//  PocketDoc
//
//  Created by branderstudio on 1/28/19.
//  Copyright © 2019 BRANDER. All rights reserved.
//

import UIKit

open class AUIDynamicSizeCollectionCell: AUIReusableCollectionCell {
  
  // MARK: - Markup
  
  private var insets: UIEdgeInsets = .zero
  private var height: CGFloat?
  private var width: CGFloat?
  private let estimatedSize: CGSize = .init(width: UIScreen.main.bounds.width, height: 44)
  
  // MARK: - Setup UI
  
  override open func setupUI(insets: UIEdgeInsets = .zero, height: CGFloat? = nil, width: CGFloat? = nil) {
    self.insets = insets
    self.height = height
    self.width = width
    super.setupUI(insets: insets, height: height, width: width)
  }
  
  override open func sizeThatFits(_ size: CGSize) -> CGSize {
    var resultHeight: CGFloat = 0
    let containerViewSize = containerView?.sizeThatFits(size)
    resultHeight += insets.top + insets.bottom
    resultHeight += height ?? containerViewSize?.height ?? 44
    var resultWidth = insets.left + insets.right
    resultWidth += width ?? containerViewSize?.width ?? size.width
    return CGSize(width: resultWidth, height: resultHeight)
  }
}
