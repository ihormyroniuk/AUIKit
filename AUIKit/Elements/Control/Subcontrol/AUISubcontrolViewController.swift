//
//  AUISubcontrolViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

public protocol AUISubcontrolViewController: AUISubviewViewController {
  
  // MARK: Delegates
  
  var subcontrolControllerDidTouchDownDelegate: AUIControlControllerDidTouchDownDelegate? { get set }
  var subcontrolControllerDidTouchUpInsideDelegate: AUIControlControllerDidTouchUpInsideDelegate? { get set }
  var subcontrolControllerDidTouchUpOutsideDelegate: AUIControlControllerDidTouchUpOutsideDelegate? { get set }
  var subcontrolControllerDidValueChangedDelegate: AUIControlControllerDidValueChangedDelegate? { get set }
  var subcontrolControllerDidEditingChangedDelegate: AUIControlControllerDidEditingChangedDelegate? { get set }
  
  // MARK: Subview
  
  var subcontrolController: AUIControlController? { get set }
  
}
