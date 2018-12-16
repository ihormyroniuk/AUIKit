//
//  AUIPagesController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 12/8/18.
//

import Foundation

public protocol AUIPagesViewControllerDidTransitToPageDelegate: class {
  func pagesViewController(_ pagesViewController: AUIPagesController, didTransitToPageControllers: [AUIPageController])
}

public protocol AUIPagesController {
  var didTransitToPageDelegate: AUIPagesViewControllerDidTransitToPageDelegate? { get set }
}
