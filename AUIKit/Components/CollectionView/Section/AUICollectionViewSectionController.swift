//
//  AUICollectionViewSectionController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 07.01.2022.
//

import UIKit

public protocol AUICollectionViewSectionController: AnyObject {
    
    // MARK: Cells

    var cellControllers: [AUICollectionViewCellController] { get set }
    var numberOfItems: Int { get }
    func prefetchCellAtIndex(_ index: Int)
    func cancelPrefetchingForCellAtIndex(_ index: Int)
    func cellForItemAtIndexPath(_ indexPath: IndexPath) -> UICollectionViewCell
    func willDisplayCell(_ cell: UICollectionViewCell,atIndex index: Int)
    func didEndDisplayingCellAtIndex(_ index: Int)
    func shouldSelectItemAtIndex(_ index: Int) -> Bool
    func didSelectCellAtIndex(_ index: Int)
    func sizeForCellAtIndex(_ index: Int) -> CGSize
    
}
