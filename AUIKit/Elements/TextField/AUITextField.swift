//
//  AUITextField.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/15/19.
//

import UIKit

class AUITextField: UITextField {
  
  // MARK: Initializer
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    autoLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    return nil
  }
  
  // MARK: Setup
  
  func setup() {
    
  }
  
  // MARK: Layout
  
  override func layoutSubviews() {
    super.layoutSubviews()
    layout()
  }
  
  func layout() {
    
  }
  
  // MARK: Auto Layout
  
  func autoLayout() {
    
  }
  
}
