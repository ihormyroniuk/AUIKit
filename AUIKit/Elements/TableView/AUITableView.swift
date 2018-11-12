//
//  TableView.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/17/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

class AUITableView: UITableView {

  // MARK: Initializer
  
  override init(frame: CGRect = .zero, style: UITableView.Style = .plain) {
    super.init(frame: frame, style: style)
    setup()
    autoLayout()
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) { return nil }
  
  // MARK: Setup
  
  func setup() {
    if #available(iOS 11, *) { contentInsetAdjustmentBehavior = .never }
    separatorStyle = .none
  }
  
  // MARK: AutoLayout
  
  func autoLayout() {
    
  }
  
  // Layout
  
  override func layoutSubviews() {
    super.layoutSubviews()
    layout()
  }

  func layout() {
    
  }
  
}
