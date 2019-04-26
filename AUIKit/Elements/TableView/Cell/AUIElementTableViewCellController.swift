//
//  AUIElementTableViewCellController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/1/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIElementTableViewCellController: AUITableViewCellController {
  
  open weak var willDisplayDelegate: AUITableViewCellControllerWillDisplayDelegate?
  open weak var didSelectDelegate: AUITableViewCellControllerDidSelectDelegate?
  
  open var view: UIView?
  
  public let controller: AUIViewController
  public let cell: (UITableView, IndexPath) -> UITableViewCell
  
  // MARK: Initializer
  
  public init(controller: AUIViewController,
       cell: @escaping (UITableView, IndexPath) -> UITableViewCell) {
    self.controller = controller
    self.cell = cell
  }
  
  
  open func didSelectCell() {
    didSelectDelegate?.didSelectTableViewCellController(self)
  }
  
  // MARK: TableViewCellController
  
  open func cellForRowAtIndexPath(_ indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
    let cell = self.cell(tableView, indexPath)
    if let containerCell = cell as? AUIContainerTableViewCell {
      view = containerCell.view
    } else {
      let containerCell = cell as? AUIViewContainerable
      (cell as? AUIConfigurableView)?.setupUIIfNeeded()
      view = containerCell?.containerView
    }
    
    if let view = view { controller.view = view }
    return cell
  }
  
  open var estimatedHeight: CGFloat {
    return UITableView.automaticDimension
  }
  
  open var height: CGFloat {
    return UITableView.automaticDimension
  }
  
  open func willDisplayCell(_ cell: UITableViewCell, indexPath: IndexPath) {
    willDisplayDelegate?.willDisplayTableViewCellController(self, indexPath: indexPath)
  }
  
  open func didEndDisplayingCell() {
    if view != nil { controller.view = nil }
    view = nil
  }
  
}
