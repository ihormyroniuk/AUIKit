//
//  AUIElementTableViewHeaderFooterController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/1/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIElementTableViewHeaderFooterController: AUITableViewHeaderFooterController {
  
  open var view: UIView?
  
  public let controller: AUIDefaultViewController
  public let headerFooterView: (UITableView) -> AUIContainerTableViewHeaderFooterView?
  
  // MARK: Initializer
  
  public init(controller: AUIDefaultViewController, headerFooterView: @escaping (UITableView) -> AUIContainerTableViewHeaderFooterView?) {
    self.controller = controller
    self.headerFooterView = headerFooterView
  }
  
  open func view(tableView: UITableView) -> UITableViewHeaderFooterView? {
    let cell = self.headerFooterView(tableView) ?? UITableViewHeaderFooterView()
    let containerCell = cell as? AUIContainerTableViewHeaderFooterView
    view = containerCell?.view
    if let view = view { controller.view = view }
    return cell
  }
  
  open var estimatedHeight: CGFloat {
    return 40
  }
  
  open var height: CGFloat {
    return UITableView.automaticDimension
  }
  
  open func didEndDisplaying() {
    controller.view = nil
    view = nil
  }
  
}
