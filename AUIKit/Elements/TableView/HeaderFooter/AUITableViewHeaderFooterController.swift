//
//  AUITableViewHeaderFooterController.swift
//  Level
//
//  Created by Ihor Myroniuk on 9/18/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUITableViewHeaderFooterController: class {
  func view(tableView: UITableView) -> UITableViewHeaderFooterView?
  var estimatedHeight: CGFloat { get }
  var height: CGFloat { get }
  func didEndDisplaying()
}
