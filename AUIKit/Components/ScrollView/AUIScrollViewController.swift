//
//  AUIScrollViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/6/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation
import UIKit

public protocol AUIScrollViewController: AUIViewController {
  
    // MARK: - UIScrollView
  
    var scrollView: UIScrollView? { get set }
    
    // MARK: - Scroll
    
    var isScrollEnabled: Bool { get set }
  
    // MARK: - Keyboard
  
    var keyboardDismissMode: UIScrollView.KeyboardDismissMode { get set }
  
}
