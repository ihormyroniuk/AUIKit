//
//  TableViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/14/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUITableViewController: AUIScrollViewController {
    
    // MARK: UIPickerView
  
    var tableView: UITableView? { get set }
    
    // MARK: Sections
    
    var sectionControllers: [AUITableViewSectionController] { get set }
    
    func deleteCellController(_ cellController: AUITableViewCellController)
    func deleteCellControllers(_ cellControllers: [AUITableViewCellController])
  
    func deleteCellControllersAnimated(_ cellControllers: [AUITableViewCellController], _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
    func deleteCellControllerAnimated(_ cellController: AUITableViewCellController, _ animation: UITableView.RowAnimation, completion: ((Bool) -> Void)?)
  
    func insertCellControllerAtSectionBeginning(_ section: AUITableViewSectionController, cellController: AUITableViewCellController)
    func insertCellControllerAtSectionEnd(_ section: AUITableViewSectionController, cellController: AUITableViewCellController)
  
    func insertCellControllers(_ cellControllers: [AUITableViewCellController], afterCellController cellController: AUITableViewCellController, inSection section: AUITableViewSectionController)
    
    // MARK:
    
    var dragInteractionEnabled: Bool { get }
    
    // MARK: Prefetching
    
    var isPrefetchingEnabled: Bool { get }
}
