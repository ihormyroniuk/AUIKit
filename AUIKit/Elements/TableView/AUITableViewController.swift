//
//  TableViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/14/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUITableViewController: AUIScrollViewController {
  func deleteCellController(_ cellController: AUITableViewCellController)
  func deleteCellControllers(_ cellControllers: [AUITableViewCellController])
  
  func deleteCellControllersAnimated(_ cellControllers: [AUITableViewCellController], _ animation: UITableView.RowAnimation)
  func deleteCellControllerAnimated(_ cellController: AUITableViewCellController, _ animation: UITableView.RowAnimation)
}
