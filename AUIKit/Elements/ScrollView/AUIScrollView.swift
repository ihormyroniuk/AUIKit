//
//  ScrollView.swift
//  Scenery
//
//  Created by Ihor Myroniuk on 8/2/18.
//  Copyright © 2018 Ihor Myroniuk. All rights reserved.
//

import UIKit

open class AUIScrollView: UIScrollView {

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
