//
//  AUIElementControlController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/2/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

public protocol AUIControlController: AUIViewController {
    
    // MARK: - Actions
    
    var touchDown: (() -> Void)? { get set }
    
    var touchUpInside: (() -> Void)? { get set }
    
    var touchUpOutside: (() -> Void)? { get set }
    
    var valueChanged: (() -> Void)? { get set }
    
    var editingChanged: (() -> Void)? { get set }
  
    // MARK: - Control
  
    var control: UIControl? { get set }
  
    // MARK: - Enabled
  
    var isEnabled: Bool { get set }
  
}
