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
    
    open func cellForItemAtIndexPath(_ indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    open func didSelectCell() {
        
    }
    
    open func willDisplayCell() {
        
    }
    
    open func didEndDisplayingCell() {
        
    }
  
}
