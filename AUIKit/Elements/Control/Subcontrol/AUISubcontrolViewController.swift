//
//  AUISubcontrolViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

public protocol AUISubcontrolViewController: AUISubviewViewController {
  
  // MARK: Subview
  
  var subcontrolController: AUIControlController? { get set }
  
}
