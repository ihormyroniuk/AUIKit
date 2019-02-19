//
//  AUIDeletingCellControllers.swift
//  Copyright © 2019 BRANDER. All rights reserved.
//

import UIKit

public protocol AUIDeletingCellControllers {
  func deleteCellControllers(_ cellControllers: [AUICollectionViewCellController], animated: Bool)
  func deleteAllCellControllers(animated: Bool)
}
