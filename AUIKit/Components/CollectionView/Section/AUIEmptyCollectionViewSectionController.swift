//
//  AUIEmptyCollectionViewSectionController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 07.01.2022.
//

import UIKit

open class AUIEmptyCollectionViewSectionController: AUICollectionViewSectionController {
    
    // MARK: Initializer

    public init() {
    
    }
  
    // MARK: Cells
  
    open var cellControllers: [AUICollectionViewCellController] = []
  
    open var numberOfItems: Int {
        return cellControllers.count
    }
    
    open func prefetchCellAtIndex(_ index: Int) {
        cellControllers[index].prefetchCell()
    }
    
    open func cancelPrefetchingForCellAtIndex(_ index: Int) {
        cellControllers[index].cancelPrefetchingForCell()
    }
        
    open func cellForItemAtIndexPath(_ indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        return cellControllers[index].cellForItemAtIndexPath(indexPath)
    }
    
    open func didSelectCellAtIndex(_ index: Int) {
        cellControllers[index].didSelectCell()
    }
  
}
