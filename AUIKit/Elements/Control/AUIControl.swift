//
//  AUIControl.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 2/5/20.
//

import UIKit

open class AUIControl: UIControl {

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

