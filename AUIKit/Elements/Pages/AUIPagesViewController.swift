//
//  AUIPagesController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 12/8/18.
//

import Foundation

public protocol AUIPagesViewControllerDidTransitToPageObserver: class {
  func pagesViewController(_ pagesViewController: AUIPagesViewController, didTransitToPageViewControllers pageViewControllers: [AUIPageViewController])
}

public protocol AUIPagesViewController {
  
  // MARK: Observers
  
  func addDidTransitToPageObserver(_ observer: AUIPagesViewControllerDidTransitToPageObserver)
  func removeDidTransitToPageObserver(_ observer: AUIPagesViewControllerDidTransitToPageObserver)
  
}
