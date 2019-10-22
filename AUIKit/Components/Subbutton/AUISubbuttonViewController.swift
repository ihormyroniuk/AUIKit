//
//  AUISubbuttonViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 6/10/19.
//

import Foundation

public protocol AUISubbuttonViewController: AUISubcontrolViewController {
  
  // MARK: Subview
  
  var subbuttonController: AUIButtonController? { get set }
  
}
