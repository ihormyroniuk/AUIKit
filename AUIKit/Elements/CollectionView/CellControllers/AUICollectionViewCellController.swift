//
//  AUICollectionViewCellController.swift
//  PocketDoc
//
//  Created by branderstudio on 10/29/18.
//  Copyright © 2018 BRANDER. All rights reserved.
//

import UIKit

public protocol AUICollectionViewCellControllerDelegate: class {
  func didSelectCollectionViewCellController(_ cellController: AUICollectionViewCellController)
}

public protocol AUICollectionViewCellController: class {
  
  var estimatedSize: CGSize { get }
  var size: CGSize { get set }
  
  var didSelectDelegate: AUICollectionViewCellControllerDelegate? { get set }
  
  func cellForRowAtIndexPath(_ indexPath: IndexPath, collectionView: UICollectionView) -> UICollectionViewCell
  
  func willDisplayCell(_ cell: UICollectionViewCell)
  func didEndDisplayCell()
  
  func didSelectCell()
}
