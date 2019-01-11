//
//  AUIDefaultTextFieldViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/9/19.
//

import Foundation

class AUIDefaultTextFieldViewController: AUIDefaultViewController {
  
  /*var textField: UITextField?
  
  var text: String?
  
  var placeholder: String?
  
  var keyboardType: UIKeyboardType
  
  var isSecureTextEntry: Bool
  
  var autocorrectionType: UITextAutocorrectionType
  
  var autocapitalizationType: UITextAutocapitalizationType
  
  var returnKeyType: UIReturnKeyType
  
  var control: UIControl?
  
  var isEnabled: Bool
  
  // MARK: Delegates
  
  weak var didChangeTextDelegate: AUITextFieldControllerDidChangeTextDelegate?
  weak var didTapReturnKeyDelegate: AUITextFieldControllerDidTapReturnKeyDelegate?
  weak var didBeginEditingDelegate: AUITextFieldControllerDidBeginEditingDelegate?
  weak var didEndEditingDelegate: AUITextFieldControllerDidEndEditingDelegate?
  weak var didEndEditingReasonDelegate: AUITextFieldControllerDidEndEditingReasonDelegate?
  weak var touchUpInsideEventDelegate: AUIControlControllerTouchUpInsideDelegate?
  weak var editingChangedEventDelegate: AUIControlControllerEditingChangedDelegate?
  weak var valueChangedEventDelegate: AUIControlControllerValueChangedDelegate?
  
  // MARK: Elements
  
  let textFieldController: AUITextFieldController = AUIDefaultTextFieldController()
  
  // MARK: Setup
  
  override func setup() {
    super.setup()
    textFieldController.didChangeTextDelegate = self
    textFieldController.didBeginEditingDelegate = self
    textFieldController.didEndEditingDelegate = self
  }
  
  // MARK: View
  
  open var textFieldView: (UIView & AUITextFieldView)? {
    set { view = newValue }
    get { return view as? (UIView & AUITextFieldView) }
  }
  
  open override func setupView() {
    super.setupView()
    textFieldController.textField = textFieldView?.textField
  }
  
  open override func unsetupView() {
    super.unsetupView()
    textFieldController.textField = nil
  }
  
  // MARK: Events
  
  func textFieldControllerDidChangeText(_ textFieldController: AUITextFieldController) {
    didChangeTextDelegate?.textFieldControllerDidChangeText(textFieldController)
  }
  
  func textFieldControllerDidBeginEditing(_ textFieldController: AUITextFieldController) {
    didBeginEditingDelegate?.textFieldControllerDidBeginEditing(textFieldController)
  }
  
  func textFieldControllerDidEndEditing(_ textFieldController: AUITextFieldController) {
    didEndEditingDelegate?.textFieldControllerDidEndEditing(textFieldController)
  }*/
  
}
