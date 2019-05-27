//
//  AUISubtextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

public protocol AUISubtextFieldViewController: AUISubcontrolViewController {

  // MARK: SubtextFieldController
  
  var subtextFieldController: AUITextFieldController? { get set }
  
}
