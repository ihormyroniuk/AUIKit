//
//  CollectionCellView.swift
//  Smaug
//
//  Created by Ihor Myroniuk on 10/18/17.
//  Copyright © 2017 Ihor Myroniuk. All rights reserved.
//

import UIKit

open class AUITableViewCellView: UITableViewCell {
  
  // MARK: Initializer

  public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setup()
    autoLayout()
  }
  
  @available(*, unavailable)
  public convenience required init?(coder aDecoder: NSCoder) { return nil }
  
  // MARK: Setup
  
  open func setup() {
    selectionStyle = .none
    contentView.frame = self.bounds
    autoresizingMask = [.flexibleWidth, .flexibleHeight]
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
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
