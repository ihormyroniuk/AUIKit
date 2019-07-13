//
//  GeneralizedCollectionView.swift
//  agroportex-ios
//
//  Created by Ihor Myroniuk on 1/30/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIContainerTableViewCell: AUITableViewCellView, AUIViewContainerable {
  
  open var view: UIView { fatalError() }
  open var containerView: UIView? {
    return view
  }
  
  // MARK: Setup
  
  open override func setup() {
    super.setup()
    contentView.addSubview(view)
  }
}
