//
//  Button.swift
//  Smaug
//
//  Created by Ihor Myroniuk on 11/23/17.
//  Copyright © 2017 Ihor Myroniuk. All rights reserved.
//

import UIKit

open class AUIButton: UIButton {

    // MARK: Initializers

     public override init(frame: CGRect = .zero) {
         super.init(frame: frame)
         setup()
         autoLayout()
     }

    @available(*, unavailable)
     public required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         setup()
         autoLayout()
     }

     // MARK: Setup

     open func setup() {

     }

     // MARK: AutoLayout

     open func autoLayout() {

     }
  
}
