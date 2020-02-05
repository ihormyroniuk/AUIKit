//
//  AUIControl.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 2/5/20.
//

import UIKit

open class AUIControl: UIControl {

    // MARK: Initializer

    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
        autoLayout()
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) { return nil }

    // MARK: Setup

    open func setup() {

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

