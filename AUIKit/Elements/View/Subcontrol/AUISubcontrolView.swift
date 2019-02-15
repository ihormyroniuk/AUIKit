//
//  AUISubcontrolViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

public protocol AUISubcontrolView: AUISubviewView {
  
  // MARK: Subcontrol
  
  var subcontrol: UIControl? { get }
  
}
