//
//  TableView.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/17/18.
//  Copyright © 2018 Brander. All rights reserved.
//
import UIKit

open class AUITableView: UITableView {
  
  // MARK: Initializer
  
  public override init(frame: CGRect, style: UITableView.Style) {
    super.init(frame: frame, style: style)
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
  
  // Layout
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    layout()
  }
  
  open func layout() {
    
  }
  
}
