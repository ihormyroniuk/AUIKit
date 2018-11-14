//
//  AUIElementTableViewCellController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/1/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIElementTableViewCellController: AUITableViewCellController {
  
  open weak var didSelectDelegate: AUITableViewCellControllerDidSelectDelegate?
  
  open var view: UIView?
  
  public let controller: AUIViewController
  public let cell: (UITableView, IndexPath) -> AUIContainerTableViewCell?
  
  // MARK: Initializer
  
  public init(controller: AUIViewController,
       cell: @escaping (UITableView, IndexPath) -> AUIContainerTableViewCell?) {
    self.controller = controller
    self.cell = cell
  }
  
  open func didSelectCell() {
    didSelectDelegate?.didSelectTableViewCellController(self)
  }
  
  // MARK: TableViewCellController
  
  open func cellForRowAtIndexPath(_ indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
    let cell = self.cell(tableView, indexPath) ?? UITableViewCell()
    let containerCell = cell as? AUIContainerTableViewCell
    view = containerCell?.view
    if let view = view { controller.view = view }
    return cell
  }
  
  open var estimatedHeight: CGFloat {
    return UITableView.automaticDimension
  }
  
  open var height: CGFloat {
    return UITableView.automaticDimension
  }
  
  open func willDisplayCell(_ cell: UITableViewCell) {
    
  }
  
  open func didEndDisplayingCell() {
    if view != nil { controller.view = nil }
    view = nil
  }
  
}
