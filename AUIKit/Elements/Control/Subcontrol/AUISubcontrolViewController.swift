//
//  AUISubcontrolViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

public protocol AUISubcontrolViewControllerDidTouchDownDelegate: class {
  func subcontrolViewControllerDidTouchDown(_ subcontrolViewController: AUISubcontrolViewController)
}

public protocol AUISubcontrolViewControllerDidTouchUpInsideDelegate: class {
  func subcontrolViewControllerDidTouchUpInside(_ subcontrolViewController: AUISubcontrolViewController)
}

public protocol AUISubcontrolViewControllerDidTouchUpOutsideDelegate: class {
  func subcontrolViewControllerDidTouchUpOutside(_ subcontrolViewController: AUISubcontrolViewController)
}

public protocol AUISubcontrolViewControllerDidEditingChangedDelegate: class {
  func subcontrolViewControllerDidEditingChanged(_ subcontrolViewController: AUISubcontrolViewController)
}

public protocol AUISubcontrolViewControllerDidValueChangedDelegate: class {
  func subcontrolViewControllerDidValueChanged(_ subcontrolViewController: AUISubcontrolViewController)
}

public protocol AUISubcontrolViewController: AUISubviewViewController {
  
  // MARK: Delegates
  
  var subcontrolViewControllerDidTouchDownDelegate: AUISubcontrolViewControllerDidTouchDownDelegate? { get set }
  var subcontrolViewControllerDidTouchUpInsideDelegate: AUISubcontrolViewControllerDidTouchUpInsideDelegate? { get set }
  var subcontrolViewControllerDidTouchUpOutsideDelegate: AUISubcontrolViewControllerDidTouchUpOutsideDelegate? { get set }
  var subcontrolViewControllerDidValueChangedDelegate: AUISubcontrolViewControllerDidValueChangedDelegate? { get set }
  var subcontrolViewControllerDidEditingChangedDelegate: AUISubcontrolViewControllerDidEditingChangedDelegate? { get set }
  
  // MARK: Subview
  
  var subcontrolController: AUIControlController? { get set }
  
}
