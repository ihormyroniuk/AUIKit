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
    func cellForItemAtIndexPath(_ indexPath: IndexPath) -> UICollectionViewCell
    func prefetchCellAtIndex(_ index: Int)
    func cancelPrefetchingForCellAtIndex(_ index: Int)
    
}
