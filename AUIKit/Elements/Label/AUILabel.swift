//
//  Label.swift
//  agroportex-ios
//
//  Created by Ihor Myroniuk on 1/25/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUILabel: UILabel {

    // MARK: Initializers
  
    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }
  
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
  
    // MARK: Setup
 
    open func setup() {
    
    }
  
}
