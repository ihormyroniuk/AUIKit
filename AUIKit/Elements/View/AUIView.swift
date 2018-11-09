//
//  View.swift
//  agroportex-ios
//
//  Created by Ihor Myroniuk on 12/7/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

public class AUIView: UIView {

  // MARK: Initializers
  
  override init(frame: CGRect = .zero) {
    super.init(frame: frame)
    setup()
    autoLayout()
  }
  
  @available(*, unavailable)
  convenience required init?(coder aDecoder: NSCoder) { return nil }
  
  // MARK: Setup
  
  func setup() {
    
  }
  
  // MAR: AutoLayout
  
  func autoLayout() {
    
  }
  
  // MARK: Layout
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    layout()
  }
  
  func layout() {
    
  }
  
}
