//
//  AUICollectionReusableView.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 23.05.2020.
//

import UIKit

open class AUICollectionReusableView: UICollectionReusableView {
    
    // MARK: Initializers
    
    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
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
