//
//  AUICollectionViewCell.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 06.01.2022.
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
    
    // MARK: Layout
  
    open override func layoutSubviews() {
        super.layoutSubviews()
        layoutContentView()
    }
    
    open func layoutContentView() {
        contentView.frame = self.bounds
    }
    
}
