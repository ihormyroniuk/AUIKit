//
//  AUIUpdatingCollectionViewController.swift
//  AUIKit
//
//  Created by branderstudio on 2/4/19.
//

import Foundation

public protocol AUIUpdatingCollectionViewController {
  func updateCellControllers(_ cellControllers: [AUICollectionViewCellController], animated: Bool)
}
