//
//  AUISubtextFieldView.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

public protocol AUISubtextFieldView: AUISubviewView {
  
  // MARK: Subcontrol
  
  var subtextField: UITextField? { get set }
  
}
