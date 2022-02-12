//
//  AUICollectionViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 06.01.2022.
//

import UIKit

public protocol AUICollectionViewController: AUIScrollViewController {
    
    // MARK: UICollectionView
  
    var collectionView: UICollectionView? { get set }
    
    // MARK: Sections
    
    var sectionControllers: [AUICollectionViewSectionController] { get set }
    
    // MARK:
    
    func deleteCellController(_ cellController: AUICollectionViewCellController)
    func deleteCellControllers(_ cellControllers: [AUICollectionViewCellController])
    func deleteCellControllersAnimated(_ cellControllers: [AUICollectionViewCellController], completion: ((Bool) -> Void)?)
    func deleteCellControllerAnimated(_ cellController: AUICollectionViewCellController, completion: ((Bool) -> Void)?)
    
}
