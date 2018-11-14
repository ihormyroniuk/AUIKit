//
//  AUIContainerCollectionViewCell.swift
//  PocketDoc
//
//  Created by branderstudio on 10/29/18.
//  Copyright © 2018 BRANDER. All rights reserved.
//

import UIKit

open class AUIContainerCollectionViewCell: AUICollectionViewCell {
  
  open var view: UIView { return UIView() }
  
  // MARK: - Setup
  
  override open func setup() {
    super.setup()
    contentView.addSubview(view)
  }
  
  // MARK: - AutoLayout
  
  override open func autoLayout() {
    super.autoLayout()
  }
}
