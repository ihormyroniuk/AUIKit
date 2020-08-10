//
//  AUICollectionViewCell.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 23.05.2020.
//

import UIKit

open class AUICollectionViewCell: UICollectionViewCell {
  
    // MARK: - Initializer
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
  
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    // MARK: - Setup
    
    open func setup() {
    
    }
    
}
