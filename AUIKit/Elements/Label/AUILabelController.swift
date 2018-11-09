//
//  AUILabelController.swift
//  Level
//
//  Created by Ihor Myroniuk on 11/2/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import Foundation

public protocol AUILabelController: AUIViewController {
  
  // MARK: Label
  
  var label: UILabel? { get set }
  
  // MARK: Text
  
  var text: String? { get set }
  
}
