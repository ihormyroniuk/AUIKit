//
//  AUICollectionViewLayout.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 22.11.2020.
//

import UIKit

open class AUICollectionViewLayout: UICollectionViewLayout {
    
    open var bounds: CGRect {
        return collectionView?.bounds ?? .zero
    }
    
    open var contentOffset: CGPoint {
        return collectionView?.contentOffset ?? .zero
    }
    
}
