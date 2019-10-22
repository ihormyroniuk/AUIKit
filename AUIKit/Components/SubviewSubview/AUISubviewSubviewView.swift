//
//  AUISubviewSubviewView.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 7/30/19.
//

import Foundation

public protocol AUISubviewSubviewView where Self: UIView {
  
  // MARK: Subview
  
  var subview1: UIView? { get }
  var subview2: UIView? { get }
  
}
