//
//  AUICollectionView.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 07.01.2022.
//

import UIKit

open class AUICollectionView: UICollectionView {
  
    // MARK: Initializer
  
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
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
