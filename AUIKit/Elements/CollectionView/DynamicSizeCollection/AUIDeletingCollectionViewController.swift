//
//  AUIDeletingCollectionViewController.swift
//  Copyright © 2019 BRANDER. All rights reserved.
//

import UIKit

public protocol AUIDeletingCollectionViewController {
  func deleteCellControllers(_ cellControllers: [AUICollectionViewCellController], animated: Bool)
}
