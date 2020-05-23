//
//  AUICollectionViewLayout.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 23.05.2020.
//

import UIKit

open class AUICollectionViewLayout: UICollectionViewLayout {
    
    // MARK: Initializers
    
    public override init() {
        super.init()
        setup()
        autoLayout()
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        autoLayout()
    }
    
    // MARK: Setup
    
    open func setup() {
    
    }
    
    // MAR: AutoLayout
    
    open func autoLayout() {
    
    }
    
}
