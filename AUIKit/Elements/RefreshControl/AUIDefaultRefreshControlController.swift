//
//  AUIRefreshControlController.swift
//  Level
//
//  Created by Ihor Myroniuk on 9/18/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultRefreshControlController: AUIDefaultControlController, AUIRefreshControlController {
  
  // MARK: View
  
  open var refreshControl: UIRefreshControl? {
    set { view = newValue }
    get { return view as? UIRefreshControl }
  }
  
  // MARK: View
  
  open override func setupView() {
    super.setupView()
    setupRefreshing()
  }
  
  // MARK: Refreshing
  
  open var isRefreshing: Bool = false
  
  open func setupRefreshing() {
    if isRefreshing { beginRefreshing()
    } else{ endRefreshing() }
  }
  
  open func beginRefreshing() {
    isRefreshing = true
    refreshControl?.beginRefreshing()
  }
  
  open func endRefreshing() {
    isRefreshing = false
    refreshControl?.endRefreshing()
  }
  
}
