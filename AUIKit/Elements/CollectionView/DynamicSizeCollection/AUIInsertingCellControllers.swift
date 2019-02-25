//
//  AUIInsertingCellControllers.swift
//  Copyright © 2019 BRANDER. All rights reserved.
//

import UIKit

public protocol AUIInsertingCellControllers {
  func insertCellControllersAtBegin(_ cellControllers: [AUICollectionViewCellController], animated: Bool)
  func insertCellControllersAtEnd(_ cellControllers: [AUICollectionViewCellController], animated: Bool)
  func insertCellControllers(_ cellControllers: [AUICollectionViewCellController], after: AUICollectionViewCellController, animated: Bool)
  func insertCellControllers(_ cellControllers: [AUICollectionViewCellController], before: AUICollectionViewCellController, animated: Bool)
}
