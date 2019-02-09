//
//  AUISubcontrolViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

public protocol AUISubcontrolViewController: AUISubviewViewController {
  
  // MARK: Delegates
  
  var subcontrolControllerTouchUpInsideEventDelegate: AUIControlControllerTouchUpInsideDelegate? { get set }
  var subcontrolControllerEditingChangedEventDelegate: AUIControlControllerEditingChangedDelegate? { get set }
  var subcontrolControllerValueChangedEventDelegate: AUIControlControllerValueChangedDelegate? { get set }
  
  // MARK: Subview
  
  var subcontrolController: AUIControlController? { get set }
  
}
