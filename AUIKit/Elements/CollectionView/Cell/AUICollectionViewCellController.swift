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
}
