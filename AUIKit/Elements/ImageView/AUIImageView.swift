//
//  ImageView.swift
//  agroportex-ios
//
//  Created by Ihor Myroniuk on 1/19/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIImageView: UIImageView {
  
  // MARK: Initializer
  
  public override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    setup()
    autoLayout()
  }
  
  @available(*, unavailable)
  public required init?(coder aDecoder: NSCoder) { return nil }
  
  // MARK: Setup
  
  open func setup() {
    
  }
  
  // MARK: AutoLayout
  
  open func autoLayout() {
    
  }
  
  // MARK: Layout
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    layout()
  }
  
  open func layout() {
    
  }
  
}
