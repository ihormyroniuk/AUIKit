//
//  AUISubviewView.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import UIKit

public protocol AUISubviewView where Self: UIView {
  
  // MARK: Subview
  
  var subview: UIView? { get }
  
}
