//
//  AUICollectionViewCell.swift
//  PocketDoc
//
//  Created by branderstudio on 10/29/18.
//  Copyright © 2018 BRANDER. All rights reserved.
//

import UIKit

class AUICollectionViewCell: UICollectionViewCell {
  
  // MARK: - Initializer
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    autoLayout()
  }
  
  @available(*, unavailable)
  convenience required init?(coder aDecoder: NSCoder) { return nil }
  
  // MARK: - Setup
  
  func setup() {
    contentView.frame = self.bounds
    autoresizingMask = [.flexibleWidth, .flexibleHeight]
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
  }
  
  // MARK: - AutoLayout
  
  func autoLayout() {
    
  }
  
  // MARK: - Layout
  
  override func layoutSubviews() {
    super.layoutSubviews()
    layout()
  }
  
  func layout() {
    
  }
}
