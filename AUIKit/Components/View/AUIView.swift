//
//  View.swift
//  agroportex-ios
//
//  Created by Ihor Myroniuk on 12/7/17.
//  Copyright © 2017 Brander. All rights reserved.
//

import UIKit

open class AUIView: UIView {

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
