//
//  AUISubtextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/25/19.
//

import Foundation

public protocol AUISubtextFieldViewControllerDidChangeTextDelegate: class {
  func textFieldViewControllerDidChangeText(_ subtextFieldViewController: AUISubtextFieldViewController)
}

public protocol AUISubtextFieldViewControllerDidTapReturnKeyDelegate: class {
  func textFieldViewControllerDidTapReturnKey(_ subtextFieldViewController: AUISubtextFieldViewController)
}

public protocol AUISubtextFieldViewControllerDidBeginEditingDelegate: class {
  func textFieldViewControllerDidBeginEditing(_ subtextFieldViewController: AUISubtextFieldViewController)
}

public protocol AUISubtextFieldViewControllerDidEndEditingDelegate: class {
  func textFieldViewControllerDidEndEditing(_ subtextFieldViewController: AUISubtextFieldViewController)
}

public protocol AUISubtextFieldViewControllerDidEndEditingReasonDelegate: class {
  func textFieldViewControllerDidEndEditingReason(_ subtextFieldViewController: AUISubtextFieldViewController, reason: UITextField.DidEndEditingReason)
}

public protocol AUISubtextFieldViewController: AUISubcontrolViewController {
  
  // MARK: Delegates
  
  var subtextFieldViewControllerDidChangeTextDelegate: AUISubtextFieldViewControllerDidChangeTextDelegate? { get set }
  var subtextFieldViewControllerDidTapReturnKeyDelegate: AUISubtextFieldViewControllerDidTapReturnKeyDelegate? { get set }
  var subtextFieldViewControllerDidBeginEditingDelegate: AUISubtextFieldViewControllerDidBeginEditingDelegate? { get set }
  var subtextFieldViewControllerDidEndEditingDelegate: AUISubtextFieldViewControllerDidEndEditingDelegate? { get set }
  var subtextFieldViewControllerDidEndEditingReasonDelegate: AUISubtextFieldViewControllerDidEndEditingReasonDelegate? { get set }
  
  // MARK: SubtextFieldController
  
  var subtextFieldController: AUITextFieldController? { get set }
  
}
