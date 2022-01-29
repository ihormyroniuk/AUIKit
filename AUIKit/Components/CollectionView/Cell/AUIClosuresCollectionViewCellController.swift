//
//  AUIClosuresCollectionViewCellController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 07.01.2022.
//

import UIKit

open class AUIClosuresCollectionViewCellController: AUIEmptyCollectionViewCellController {
  
    // MARK: AUICollectionViewCellController
    
    open var prefetchCellClosure: (() -> Void)?
    open override func prefetchCell() {
        prefetchCellClosure?()
    }
    
    open var cancelPrefetchingForCellClosure: (() -> Void)?
    open override func cancelPrefetchingForCell() {
        cancelPrefetchingForCellClosure?()
    }
    
    open var cellForItemAtIndexPathClosure: ((IndexPath) -> UICollectionViewCell)?
    open override func cellForItemAtIndexPath(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cellForItemAtIndexPathClosure?(indexPath)
        return cell ?? UICollectionViewCell()
    }
    
    open var didSelectClosure: (() -> Void)?
    open override func didSelectCell() {
        didSelectClosure?()
    }
    
    open var willDisplayCellClosure: (() -> Void)?
    open override func willDisplayCell() {
        willDisplayCellClosure?()
    }
    
    open var didEndDisplayingCellClosure: (() -> Void)?
    open override func didEndDisplayingCell() {
        didEndDisplayingCellClosure?()
    }
    
    open var sizeForCellClosure: (() -> CGSize)?
    public override var sizeForCell: CGSize {
        return sizeForCellClosure?() ?? .zero
    }

}
