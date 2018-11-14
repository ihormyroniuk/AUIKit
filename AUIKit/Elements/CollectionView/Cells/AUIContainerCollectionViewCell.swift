//
//  AUIContainerCollectionViewCell.swift
//  PocketDoc
//
//  Created by branderstudio on 10/29/18.
//  Copyright © 2018 BRANDER. All rights reserved.
//

import UIKit

class AUIContainerCollectionViewCell: AUICollectionViewCell {
  
  var view: UIView { return UIView() }
  
  // MARK: - Setup
  
  override func setup() {
    super.setup()
    contentView.addSubview(view)
  }
  
  // MARK: - AutoLayout
  
  override func autoLayout() {
    super.autoLayout()
  }
}
