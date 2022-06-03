//
//  EndRefreshingDelayRefreshControl.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 9/18/19.
//

import Foundation
import UIKit

open class AUIEndRefreshingDelayRefreshControl: UIRefreshControl {
  
  open override func didMoveToWindow() {
    super.didMoveToWindow()
    if !isRefreshing {
      super.beginRefreshing()
      super.endRefreshing()
    }
  }
  
  open override func endRefreshing() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.16) { [weak self] in
      guard let self = self else { return }
      self.stopRefreshing()
    }
  }
  
  private func stopRefreshing() {
    super.endRefreshing()
  }
}
