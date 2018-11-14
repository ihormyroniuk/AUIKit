//
//  AUICollectionViewCell.swift
//  PocketDoc
//
//  Created by branderstudio on 10/29/18.
//  Copyright © 2018 BRANDER. All rights reserved.
//

import UIKit

open class AUICollectionViewCell: UICollectionViewCell {
  
  // MARK: - Initializer
  
  override public init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    autoLayout()
  }
  
  @available(*, unavailable)
  convenience required public init?(coder aDecoder: NSCoder) { return nil }
  
  // MARK: - Setup
  
  open func setup() {
    contentView.frame = self.bounds
    autoresizingMask = [.flexibleWidth, .flexibleHeight]
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
  }
  
  // MARK: - AutoLayout
  
  open func autoLayout() {
    
  }
  
  // MARK: - Layout
  
  override open func layoutSubviews() {
    super.layoutSubviews()
    layout()
  }
  
  open func layout() {
    
  }
}
