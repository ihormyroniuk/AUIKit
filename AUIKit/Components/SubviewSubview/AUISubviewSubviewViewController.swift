//
//  AUISubviewSubviewViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 7/30/19.
//

import Foundation

public protocol AUISubviewSubviewViewController: AUIViewController {
  
  // MARK: Subview Controller
  
  var subviewController1: AUIViewController? { get set }
  var subviewController2: AUIViewController? { get set }
}
