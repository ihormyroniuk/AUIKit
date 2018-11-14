//
//  AUIScrollViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/6/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

public protocol AUIScrollViewController: AUIViewController {
  
  // MARK: Scroll View
  
  var scrollView: UIScrollView? { get set }
  
  // MARK: Keyboard
  
  var keyboardDismissMode: UIScrollView.KeyboardDismissMode { get set }
  var isScrollEnabled: Bool { get set }
  
}
