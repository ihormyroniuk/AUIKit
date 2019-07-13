//
//  AUIPagesController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 12/8/18.
//

import Foundation

public protocol AUIPagesViewControllerDidTransitToPageObserver: class {
  func pagesViewController(_ pagesViewController: AUIPagesController, didTransitToPageControllers: [AUIPageViewController])
}

public protocol AUIPagesController {
  var didTransitToPageDelegate: AUIPagesViewControllerDidTransitToPageObserver? { get set }
}
