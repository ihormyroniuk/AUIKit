//
//  TableViewCellController.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/17/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUITableViewCellControllerDidSelectDelegate: AnyObject {
  func didSelectTableViewCellController(_ cellController: AUITableViewCellController)
}

public protocol AUITableViewCellControllerWillDisplayDelegate: AnyObject {
  func willDisplayTableViewCellController(_ cellController: AUITableViewCellController, indexPath: IndexPath)
}

public protocol AUITableViewCellController: AnyObject {
  func cellForRowAtIndexPath(_ indexPath: IndexPath, tableView: UITableView) -> UITableViewCell
  var willDisplayDelegate: AUITableViewCellControllerWillDisplayDelegate? { get set }
  func willDisplayCell(_ cell: UITableViewCell, indexPath: IndexPath)
  func didEndDisplayingCell()
  var didSelectDelegate: AUITableViewCellControllerDidSelectDelegate? { get set }
  func didSelectCell()
  var estimatedHeight: CGFloat { get }
  var height: CGFloat { get }
}
