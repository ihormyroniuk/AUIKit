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
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: Setup

    open func setup() {

    }

}
