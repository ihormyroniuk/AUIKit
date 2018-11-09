//
//  AUIToolbar.swift
//  Level
//
//  Created by Ihor Myroniuk on 10/1/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

class AUIToolbar: UIToolbar {

  // MARK: Initializer
  
  public override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    setup()
    autoLayout()
  }
  
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
