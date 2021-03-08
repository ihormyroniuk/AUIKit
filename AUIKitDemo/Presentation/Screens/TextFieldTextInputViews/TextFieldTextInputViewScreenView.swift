//
//  TextInputViewTextFieldScreenView.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 26.07.2020.
//

import UIKit
import AUIKit

class TextFieldTextInputViewScreenView: BackButtonTitleLabelScreenView {
    
    // MARK: Subviews
    
    let scrollView = UIScrollView()
    let stringTextFieldTextInputView = TextFieldTextInputView()
    let dateDatePicker = UIDatePicker()
    let dateTextFieldTextInputView = TextFieldTextInputView()
    let countDownDurationDatePicker = UIDatePicker()
    let countDownDurationTextFieldTextInputView = TextFieldTextInputView()
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(stringTextFieldTextInputView)
        scrollView.addSubview(dateTextFieldTextInputView)
        setupDateTextFieldTextInputView()
        scrollView.addSubview(countDownDurationTextFieldTextInputView)
        setupCountDownDurationTextFieldTextInputView()
    }
    
    private func setupDateTextFieldTextInputView() {
        if #available(iOS 13.4, *) {
            dateDatePicker.preferredDatePickerStyle = .wheels
        }
        dateTextFieldTextInputView.textField.inputView = dateDatePicker
    }
    
    private func setupCountDownDurationTextFieldTextInputView() {
        countDownDurationTextFieldTextInputView.textField.inputView = countDownDurationDatePicker
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutStringTextFieldTextInputView()
        layoutDateTextFieldTextInputView()
        layoutCountDownDurationTextFieldTextInputView()
        layoutScrollView()
    }
    
    private func layoutScrollView() {
        let x: CGFloat = 0
        let y = navigationBarView.frame.origin.y + navigationBarView.frame.size.height + 1
        let origin = CGPoint(x: x, y: y)
        let width = bounds.width
        let height = bounds.height - y
        let size = CGSize(width: width, height: height)
        let frame = CGRect(origin: origin, size: size)
        scrollView.frame = frame
        let contentWidth = bounds.width
        let contentHeight = dateTextFieldTextInputView.frame.origin.y + dateTextFieldTextInputView.frame.size.height + 24
        let contentSize = CGSize(width: contentWidth, height: contentHeight)
        scrollView.contentSize = contentSize
    }
    
    private func layoutStringTextFieldTextInputView() {
        let x: CGFloat = 24
        let y: CGFloat = 24
        let origin = CGPoint(x: x, y: y)
        let possibleWidth = bounds.width - 2 * x
        let possibleHeight = CGFloat.greatestFiniteMagnitude
        let possibleSize = CGSize(width: possibleWidth, height: possibleHeight)
        let size = stringTextFieldTextInputView.sizeThatFits(possibleSize)
        let frame = CGRect(origin: origin, size: size)
        stringTextFieldTextInputView.frame = frame
    }
    
    private func layoutDateTextFieldTextInputView() {
        let x: CGFloat = 24
        let y: CGFloat = stringTextFieldTextInputView.frame.origin.y + stringTextFieldTextInputView.frame.size.height + 24
        let origin = CGPoint(x: x, y: y)
        let possibleWidth = bounds.width - 2 * x
        let possibleHeight = CGFloat.greatestFiniteMagnitude
        let possibleSize = CGSize(width: possibleWidth, height: possibleHeight)
        let size = dateTextFieldTextInputView.sizeThatFits(possibleSize)
        let frame = CGRect(origin: origin, size: size)
        dateTextFieldTextInputView.frame = frame
    }
    
    private func layoutCountDownDurationTextFieldTextInputView() {
        let x: CGFloat = 24
        let y: CGFloat = dateTextFieldTextInputView.frame.origin.y + dateTextFieldTextInputView.frame.size.height + 24
        let origin = CGPoint(x: x, y: y)
        let possibleWidth = bounds.width - 2 * x
        let possibleHeight = CGFloat.greatestFiniteMagnitude
        let possibleSize = CGSize(width: possibleWidth, height: possibleHeight)
        let size = countDownDurationTextFieldTextInputView.sizeThatFits(possibleSize)
        let frame = CGRect(origin: origin, size: size)
        countDownDurationTextFieldTextInputView.frame = frame
    }
    
}
