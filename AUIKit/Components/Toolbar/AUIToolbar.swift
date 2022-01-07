//
//  AUIToolbar.swift
//  Level
//
//  Created by Ihor Myroniuk on 10/1/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIToolbar: UIToolbar {

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
