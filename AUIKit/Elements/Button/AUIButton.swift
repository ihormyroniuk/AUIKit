//
//  Button.swift
//  Smaug
//
//  Created by Ihor Myroniuk on 11/23/17.
//  Copyright © 2017 Ihor Myroniuk. All rights reserved.
//

import UIKit

open class AUIButton: UIButton {

  // MARK: Initializer
  
  public init() {
    super.init(frame: .zero)
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
