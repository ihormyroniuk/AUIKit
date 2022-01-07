//
//  AUIEmptyCollectionViewCellController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 07.01.2022.
//

import UIKit

open class AUIEmptyCollectionViewCellController: AUICollectionViewCellController {
  
    // MARK: Initializer
  
    public init() {
        
    }
    
    open func prefetchCell() {
        
    }
    
    open func cancelPrefetchingForCell() {
        
    }
    
    public func cellForItemAtIndexPath(_ indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
  
}
