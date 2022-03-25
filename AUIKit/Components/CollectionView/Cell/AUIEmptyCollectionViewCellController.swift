//
//  AUIEmptyCollectionViewCellController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 07.01.2022.
//

import UIKit

open class AUIEmptyCollectionViewCellController: AUIEmptyViewController, AUICollectionViewCellController {
  

    // MARK: CollectionViewCell
  
    open var collectionViewCell: UICollectionViewCell? {
        set { view = newValue }
        get { return view as? UICollectionViewCell }
    }
  
    open override func setupView() {
        super.setupView()
        setupCollectionViewCell()
    }
  
    open func setupCollectionViewCell() {
        
    }
  
    open override func unsetupView() {
        super.unsetupView()
        unsetupCollectionViewCell()
    }
  
    open func unsetupCollectionViewCell() {
    
    }
    
    // MARK: AUICollectionViewCellController
    
    open func prefetchCell() {
        
    }
    
    open func cancelPrefetchingForCell() {
        
    }
    
    open func cellForItemAtIndexPath(_ indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    open var sizeForCell: CGSize {
        return .zero
    }
    
    open func willDisplayCell(_ cell: UICollectionViewCell) {
        if collectionViewCell != cell {
            collectionViewCell = cell
        }
    }
    
    open func didEndDisplayingCell() {
        collectionViewCell = nil
    }
  
    open var shouldSelectCell: Bool {
        return true
    }
    
    open func didSelectCell() {
        
    }
    
}
