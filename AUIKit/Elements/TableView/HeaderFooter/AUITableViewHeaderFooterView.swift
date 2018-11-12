//
//  AUITableViewHeaderFooterView.swift
//  Level
//
//  Created by Ihor Myroniuk on 9/18/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUITableViewHeaderFooterView: UITableViewHeaderFooterView {

  // MARK: Initializers
  
  public override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    setup()
    autoLayout()
  }
  
  @available(*, unavailable)
  public convenience required init?(coder aDecoder: NSCoder) { return nil }
  
  // MARK: Setup
  
  open func setup() {
    backgroundView = UIView()
    backgroundView?.alpha = 0
    autoresizingMask = [.flexibleWidth, .flexibleHeight]
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
