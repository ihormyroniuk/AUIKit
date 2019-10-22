//
//  AUISubtextViewViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 2/16/19.
//

import Foundation

public protocol AUISubtextViewViewController: AUISubcontrolViewController {

  // MARK: Subview
  
  var subtextViewController: AUITextViewController? { get set }
  
}
