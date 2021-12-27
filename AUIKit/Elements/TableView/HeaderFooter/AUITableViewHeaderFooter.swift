//
//  AUITableViewHeaderFooterView.swift
//  Level
//
//  Created by Ihor Myroniuk on 9/18/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUITableViewHeaderFooter: UITableViewHeaderFooterView {

    // MARK: Initializers
  
    public override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
  
    public convenience required init?(coder aDecoder: NSCoder) { return nil }
  
    // MARK: Setup
  
    open func setup() {
      
    }

}
