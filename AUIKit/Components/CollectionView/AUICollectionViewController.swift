//
//  AUICollectionViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 06.01.2022.
//

import UIKit

public protocol AUICollectionViewController: AUIScrollViewController {
    
    // MARK: Sections
    
    var sectionControllers: [AUICollectionViewSectionController] { get set }
    
    // MARK: UIPickerView
  
    var collectionView: UICollectionView? { get set }
}
