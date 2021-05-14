//
//  TextInputViewTextFieldScreenController.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 26.07.2020.
//

import UIKit
import AUIKit

protocol TextFieldTextInputViewScreenControllerDelegate: AnyObject {
    func textFieldTextInputViewScreenControllerBack(_ textFieldTextInputViewScreenController: TextFieldTextInputViewScreenController)
}

class TextFieldTextInputViewScreenController: AUIEmptyScreenController, AUIControlControllerDidValueChangedObserver, AUITextFieldControllerDidBeginEditingObserver {
    
    // MARK: Delegate
    
    weak var delegate: TextFieldTextInputViewScreenControllerDelegate?
    
    // MARK: View
    
    private var textInputViewTextFieldScreenView: TextFieldTextInputViewScreenView! {
        return view as? TextFieldTextInputViewScreenView
    }
    
    // MARK: Subviews
    
    private let stringTextFieldController = AUITextInputFilterValidatorFormatterTextFieldController()
    private let stringTextFieldTextInputView = AUIResponsiveTextFieldTextInputViewController()
    private let dateDatePickerConroller = AUIEmptyDateTimePickerController()
    private let dateTextFieldController = AUIEmptyTextFieldController()
    private let dateTextFieldTextInputView = AUIResponsiveTextFieldTextInputViewController()
    private let countDownDurationDatePickerConroller = AUIEmptyCountDownDurationDatePickerController()
    private let countDownDurationTextFieldController = AUIEmptyTextFieldController()
    private let countDownDurationTextFieldTextInputView = AUIResponsiveTextFieldTextInputViewController()
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        textInputViewTextFieldScreenView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        setContent()
        setupStringTextFieldTextInputView()
        setupDateTextFieldTextInputView()
        setupCountDownDurationTextFieldTextInputView()
    }
    
    private func setupStringTextFieldTextInputView() {
        let maximumLenghtTextInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: 10)
        let allowedCharactersTextInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: .letters)
        let inputTextValidator = AUICompositeTextInputValidator(textInputValidators: [maximumLenghtTextInputValidator, allowedCharactersTextInputValidator])
        stringTextFieldController.textInputValidator = inputTextValidator
        stringTextFieldTextInputView.view = textInputViewTextFieldScreenView.stringTextFieldTextInputView
        stringTextFieldTextInputView.textFieldController = stringTextFieldController
        stringTextFieldController.keyboardType = .alphabet
    }
    
    private func setupDateTextFieldTextInputView() {
        dateDatePickerConroller.setDate(Date().addingTimeInterval(-10000000), animated: false)
        dateDatePickerConroller.addDidValueChangedObserver(self)
        dateTextFieldController.inputViewController = dateDatePickerConroller
        dateTextFieldController.addDidBeginEditingObserver(self)
        dateTextFieldTextInputView.view = textInputViewTextFieldScreenView.dateTextFieldTextInputView
        dateTextFieldTextInputView.textFieldController = dateTextFieldController
    }
    
    private func setupCountDownDurationTextFieldTextInputView() {
        countDownDurationDatePickerConroller.countDownDuration = 60 * 60 * 7
        countDownDurationDatePickerConroller.addDidValueChangedObserver(self)
        countDownDurationDatePickerConroller.minuteInterval = 1
        countDownDurationTextFieldController.addDidBeginEditingObserver(self)
        countDownDurationTextFieldController.inputViewController = countDownDurationDatePickerConroller
        countDownDurationTextFieldTextInputView.view = textInputViewTextFieldScreenView.countDownDurationTextFieldTextInputView
        countDownDurationTextFieldTextInputView.textFieldController = countDownDurationTextFieldController
    }
    
    // MARK: Events
    
    func textFieldControllerDidBeginEditing(_ textFieldController: AUITextFieldController) {
        if dateTextFieldController === textFieldController {
            let date = dateDatePickerConroller.date
            dateTextFieldController.text = "\(date)"
        }
        if countDownDurationTextFieldController === textFieldController {
            let countDownDuration = countDownDurationDatePickerConroller.countDownDuration
            countDownDurationTextFieldController.text = "\(countDownDuration)"
        }
    }
    
    func controlControllerDidValueChanged(_ controlController: AUIControlController) {
        if dateDatePickerConroller === controlController {
            let date = dateDatePickerConroller.date
            dateTextFieldController.text = "\(date)"
        }
        if countDownDurationDatePickerConroller === controlController {
            let countDownDuration = countDownDurationDatePickerConroller.countDownDuration
            countDownDurationTextFieldController.text = "\(countDownDuration)"
        }
    }
    
    // MARK: Actions
    
    @objc private func back() {
        delegate?.textFieldTextInputViewScreenControllerBack(self)
    }
    
    // MARK: Content
    
    private func setContent() {
        textInputViewTextFieldScreenView.titleLabel.text = "Text Field Text Input View"
        textInputViewTextFieldScreenView.stringTextFieldTextInputView.placeholderLabel.text = "String (maximum 10 symbols, only alphabet characters)"
        textInputViewTextFieldScreenView.dateTextFieldTextInputView.placeholderLabel.text = "Date (UIDatePicker)"
        textInputViewTextFieldScreenView.countDownDurationTextFieldTextInputView.placeholderLabel.text = "Count down duration (UIDatePicker)"
    }
    
}
