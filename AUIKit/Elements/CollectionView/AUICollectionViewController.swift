//
//  AUICollectionViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 06.01.2022.
//

import UIKit

public protocol AUICollectionViewController: AUIScrollViewController {
    
    var sectionControllers: [AUITableViewSectionController] { get set }
  
    func deleteCellController(_ cellController: AUITableViewCellController)
    func deleteCellControllers(_ cellControllers: [AUITableViewCellController])
  
    func deleteCellControllersAnimated(_ cellControllers: [AUITableViewCellController], _ animation: UITableView.RowAnimation)
    func deleteCellControllerAnimated(_ cellController: AUITableViewCellController, _ animation: UITableView.RowAnimation)
  
    func insertCellControllerAtSectionBeginning(_ section: AUITableViewSectionController, cellController: AUITableViewCellController)
    func insertCellControllerAtSectionEnd(_ section: AUITableViewSectionController, cellController: AUITableViewCellController)
  
    func insertCellControllers(_ cellControllers: [AUITableViewCellController], afterCellController cellController: AUITableViewCellController, inSection section: AUITableViewSectionController)
}
