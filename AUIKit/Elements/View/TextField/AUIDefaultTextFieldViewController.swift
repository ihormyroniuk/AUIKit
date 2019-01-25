//
//  AUIDefaultTextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/9/19.
//

import Foundation

open class AUIDefaultTextFieldViewController: AUIDefaultViewController, AUITextFieldControllerDidChangeTextDelegate, AUITextFieldControllerDidBeginEditingDelegate, AUITextFieldControllerDidEndEditingDelegate, AUITextFieldControllerDidEndEditingReasonDelegate {
  
  // MARK: Delegates
  
  open weak var didChangeTextDelegate: AUITextFieldControllerDidChangeTextDelegate?
  open weak var didTapReturnKeyDelegate: AUITextFieldControllerDidTapReturnKeyDelegate?
  open weak var didBeginEditingDelegate: AUITextFieldControllerDidBeginEditingDelegate?
  open weak var didEndEditingDelegate: AUITextFieldControllerDidEndEditingDelegate?
  open weak var didEndEditingReasonDelegate: AUITextFieldControllerDidEndEditingReasonDelegate?
  open weak var touchUpInsideEventDelegate: AUIControlControllerTouchUpInsideDelegate?
  open weak var editingChangedEventDelegate: AUIControlControllerEditingChangedDelegate?
  open weak var valueChangedEventDelegate: AUIControlControllerValueChangedDelegate?
  
  // MARK: Elements
  
  public var textFieldController: AUITextFieldController? {
    didSet {
      didSetTextFieldController(oldValue)
    }
  }
  
  func didSetTextFieldController(_ oldValue: AUITextFieldController?) {
    oldValue?.textField = nil
    oldValue?.didChangeTextDelegate = nil
    oldValue?.didBeginEditingDelegate = nil
    oldValue?.didEndEditingDelegate = nil
    oldValue?.didEndEditingReasonDelegate = nil
    textFieldController?.textField = textFieldView?.textField
    textFieldController?.didChangeTextDelegate = self
    textFieldController?.didBeginEditingDelegate = self
    textFieldController?.didEndEditingDelegate = self
    textFieldController?.didEndEditingReasonDelegate = self
  }
  
  // MARK: View
  
  open var textFieldView: (UIView & AUITextFieldView)? {
    set { view = newValue }
    get { return view as? (UIView & AUITextFieldView) }
  }
  
  open override func setupView() {
    super.setupView()
    textFieldController?.textField = textFieldView?.textField
  }
  
  open override func unsetupView() {
    super.unsetupView()
    textFieldController?.textField = nil
  }
  
  // MARK: Events
  
  open func textFieldControllerDidChangeText(_ textFieldController: AUITextFieldController) {
    didChangeTextDelegate?.textFieldControllerDidChangeText(textFieldController)
  }
  
  open func textFieldControllerDidBeginEditing(_ textFieldController: AUITextFieldController) {
    didBeginEditingDelegate?.textFieldControllerDidBeginEditing(textFieldController)
  }
  
  open func textFieldControllerDidEndEditing(_ textFieldController: AUITextFieldController) {
    didEndEditingDelegate?.textFieldControllerDidEndEditing(textFieldController)
  }
  
  public func textFieldControllerDidEndEditingReason(_ controller: AUITextFieldController, reason: UITextField.DidEndEditingReason) {
    didEndEditingReasonDelegate?.textFieldControllerDidEndEditingReason(controller, reason: reason)
  }
  
}
