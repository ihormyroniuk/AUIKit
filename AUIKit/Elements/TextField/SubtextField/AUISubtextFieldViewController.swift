//
//  AUISubtextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

public protocol AUISubtextFieldViewController: AUISubcontrolViewController {
  
  // MARK: Subview
  
  var subtextFieldController: AUITextFieldController? { get set }
  
  // MARK: Delegates
  
  var subtextFieldControllerDidChangeTextDelegate: AUITextFieldControllerDidChangeTextDelegate? { get set }
  var subtextFieldControllerDidTapReturnKeyDelegate: AUITextFieldControllerDidTapReturnKeyDelegate? { get set }
  var subtextFieldControllerDidBeginEditingDelegate: AUITextFieldControllerDidBeginEditingDelegate? { get set }
  var subtextFieldControllerDidEndEditingDelegate: AUITextFieldControllerDidEndEditingDelegate? { get set }
  var subtextFieldControllerDidEndEditingReasonDelegate: AUITextFieldControllerDidEndEditingReasonDelegate? { get set }
  
}
