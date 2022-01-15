//
//  ImageView.swift
//  agroportex-ios
//
//  Created by Ihor Myroniuk on 1/19/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIImageView: UIImageView {
  
    // MARK: Initializers
  
    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }
  
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        return nil
    }
  
    // MARK: Setup
  
    open func setup() {
    
    }
  
}
