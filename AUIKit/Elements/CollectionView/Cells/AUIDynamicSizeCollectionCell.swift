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
    let correctedSize = getCorrectedContentSize(from: size, insets: insets)
    let containerViewSize = containerView?.sizeThatFits(correctedSize) ?? getDefaultSize()
    
    let resultSize = CGSize(
      width: (width ?? containerViewSize.width) + calculateWidthOffset(insets: insets),
      height: ((height ?? containerViewSize.height) + calculateHeightOffset(insets: insets)).rounded(.awayFromZero))
    return resultSize
  }
  
  private func getDefaultSize() -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: 44)
  }
  
  private func calculateWidthOffset(insets: UIEdgeInsets) -> CGFloat {
    return insets.left + insets.right
  }
  
  private func calculateHeightOffset(insets: UIEdgeInsets) -> CGFloat {
    return insets.top + insets.bottom
  }
  
  private func getCorrectedContentSize(from size: CGSize, insets: UIEdgeInsets) -> CGSize {
    return CGSize(width: width ?? size.width - calculateWidthOffset(insets: insets),
                  height: height ?? size.height - calculateHeightOffset(insets: insets))
  }
  
  private func getCorrectedSize(from size: CGSize, insets: UIEdgeInsets) -> CGSize {
    return CGSize(width: size.width - calculateWidthOffset(insets: insets),
                  height: size.height - calculateHeightOffset(insets: insets))
  }
}
