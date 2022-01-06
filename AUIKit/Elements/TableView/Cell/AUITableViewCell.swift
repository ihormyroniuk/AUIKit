//
//  CollectionCellView.swift
//  Smaug
//
//  Created by Ihor Myroniuk on 10/18/17.
//  Copyright © 2017 Ihor Myroniuk. All rights reserved.
//

import UIKit

open class AUITableViewCell: UITableViewCell {
  
    // MARK: Initializer

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    @available(*, unavailable)
    public convenience required init?(coder aDecoder: NSCoder) {
        return nil
    }
  
    // MARK: Setup
  
    open func setup() {
        
    }
  
    // MARK: Layout
  
    open override func layoutSubviews() {
        super.layoutSubviews()
        layoutContentView()
    }
    
    open func layoutContentView() {
        contentView.frame = self.bounds
    }
    
}
