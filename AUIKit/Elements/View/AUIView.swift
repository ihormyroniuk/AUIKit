//
//  View.swift
//  agroportex-ios
//
//  Created by Ihor Myroniuk on 12/7/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

open class AUIView: UIView {

  // MARK: Initializers
  
  public override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    setup()
    autoLayout()
  }
  
  @available(*, unavailable)
  public convenience required init?(coder aDecoder: NSCoder) { return nil }
  
  // MARK: Setup
  
  open func setup() {
    
  }
  
  // MAR: AutoLayout
  
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
