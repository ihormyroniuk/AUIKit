//
//  AUITextView.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 2/15/19.
//

import UIKit

open class AUITextView: UITextView {
  
  // MARK: Initializer
  
  public override init(frame: CGRect = .zero, textContainer: NSTextContainer? = nil) {
    super.init(frame: frame, textContainer: textContainer)
    setup()
    autoLayout()
  }

  public required init?(coder aDecoder: NSCoder) {
    return nil
  }
  
  // MARK: Setup
  
  open func setup() {
    
  }
  
  // MARK: Auto Layout
  
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
