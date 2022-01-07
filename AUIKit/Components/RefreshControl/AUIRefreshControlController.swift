//
//  AUIRefreshControlController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/2/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUIRefreshControlController: AUIControlController {
  
  // MARK: Refresh Control
  
  var refreshControl: UIRefreshControl? { get set }
  
  // MARK: Refreshing
  
  func beginRefreshing()
  
  func endRefreshing()
}
