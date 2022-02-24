//
//  AUICollectionViewCellController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 07.01.2022.
//

import UIKit

public protocol AUICollectionViewCellController: AnyObject {
    func prefetchCell()
    func cancelPrefetchingForCell()
    func cellForItemAtIndexPath(_ indexPath: IndexPath) -> UICollectionViewCell
    func willDisplayCell()
    func didEndDisplayingCell()
    var shouldSelectCell: Bool { get }
    func didSelectCell()
    var sizeForCell: CGSize { get }
}
