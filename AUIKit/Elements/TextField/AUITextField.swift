//
//  AUITextField.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/15/19.
//

import UIKit

open class AUITextField: UITextField {
  
  // MARK: Initializer
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    autoLayout()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    return nil
  }
  
  // MARK: Setup
  
  open func setup() {
    
  }
  
  // MARK: Layout
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    layout()
  }
  
  open func layout() {
    
  }
  
  // MARK: Auto Layout
  
  open func autoLayout() {
    
  }
  
}
