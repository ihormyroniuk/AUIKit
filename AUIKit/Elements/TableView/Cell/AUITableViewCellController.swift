//
//  TableViewCellController.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/17/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUITableViewCellControllerDidSelectDelegate: class {
  func didSelectTableViewCellController(_ cellController: AUITableViewCellController)
}

public protocol AUITableViewCellController: class {
  func cellForRowAtIndexPath(_ indexPath: IndexPath, tableView: UITableView) -> UITableViewCell
  func willDisplayCell(_ cell: UITableViewCell)
  func didEndDisplayingCell()
  var didSelectDelegate: AUITableViewCellControllerDidSelectDelegate? { get set }
  func didSelectCell()
  var estimatedHeight: CGFloat { get }
  var height: CGFloat { get }
}
