//
//  AUISubviewViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

public protocol AUISubviewViewController: AUIViewController {
 
  // MARK: Subview Controller
  
  var subviewController: AUIViewController? { get set }
}
