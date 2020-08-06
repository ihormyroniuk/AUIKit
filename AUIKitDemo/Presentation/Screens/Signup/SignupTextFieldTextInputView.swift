//
//  SignupTextFieldTextInputView.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 04.08.2020.
//

import UIKit
import AUIKit

class SignupTextFieldTextInputView: AUIView, AUITextFieldTextInputView, AUIResponsiveTextInputView {
    
    // MARK: Subviews
    
    let iconImageView = UIImageView()
    let textField = UITextField()
    let underlineView = UIView()
    let placeholderLabel = UILabel()
    
    // MARK: States
    
    private var isActive = false
    
    private func updateState(animated: Bool) {
        setNeedsLayout()
        if animated {
            UIView.animate(withDuration: animationDuration, animations: { [weak self] in
                guard let self = self else { return }
                self.setupUnderlineView()
                self.setupPlaceholderLabel()
                self.layoutIfNeeded()
            })
        } else {
            layoutIfNeeded()
        }
    }
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        addSubview(iconImageView)
        setupIconImageView()
        addSubview(textField)
        setupTextField()
        addSubview(underlineView)
        setupUnderlineView()
        addSubview(placeholderLabel)
        setupPlaceholderLabel()
    }
    
    private func setupIconImageView() {
        iconImageView.contentMode = .scaleAspectFit
    }
    
    private func setupTextField() {
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textField.tintColor = .black
    }
    
    private func setupUnderlineView() {
        if isActive {
            underlineView.backgroundColor = .black
        } else {
            underlineView.backgroundColor = .lightGray
        }
    }
    
    private func setupPlaceholderLabel() {
        placeholderLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        if isActive {
            placeholderLabel.textColor = .black
        } else {
            placeholderLabel.textColor = .lightGray
        }
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.frame = layoutIconImageView(bounds.size)
        placeholderLabel.frame = layoutPlaceholderLabel(bounds.size)
        textField.frame = layoutTextField(bounds.size)
        underlineView.frame = layoutUnderlineView(bounds.size)
    }
    
    func layoutIconImageView(_ boundsSize: CGSize) -> CGRect {
        let textFieldPossibleSize = CGSize(width: boundsSize.width, height: boundsSize.height)
        let textFieldSize = textField.sizeThatFits(textFieldPossibleSize)
        let x: CGFloat = 0
        let y = placeholderLabelSize(boundsSize).height + 1
        let width = textFieldSize.height + 8
        let height = textFieldSize.height + 8
        let frame = CGRect(x: x, y: y, width: width, height: height)
        return frame
    }
    
    func layoutTextField(_ boundsSize: CGSize) -> CGRect {
        let x = layoutIconImageView(boundsSize).width + 8
        let y = placeholderLabelSize(boundsSize).height + 1
        let origin = CGPoint(x: x, y: y)
        let width = boundsSize.width - x
        let possibleSize = CGSize(width: width, height: boundsSize.height)
        var size = textField.sizeThatFits(possibleSize)
        size.width = width
        size.height = size.height + 8
        let frame = CGRect(origin: origin, size: size)
        return frame
    }
    
    func placeholderLabelSize(_ boundsSize: CGSize) -> CGSize {
        let possibleWidth = bounds.width
        let possibleHeight = CGFloat.greatestFiniteMagnitude
        let possibleSize = CGSize(width: possibleWidth, height: possibleHeight)
        let size = placeholderLabel.sizeThatFits(possibleSize)
        return size
    }
    private func layoutPlaceholderLabelTop(_ boundsSize: CGSize) -> CGRect {
        let textFieldFrame = layoutTextField(bounds.size)
        let x = textFieldFrame.origin.x
        let y: CGFloat = 0
        let origin = CGPoint(x: x, y: y)
        let size = placeholderLabelSize(boundsSize)
        let frame = CGRect(origin: origin, size: size)
        return frame
    }
    private func layoutPlaceholderLabelCenter(_ boundsSize: CGSize) -> CGRect {
        let textFieldFrame = layoutTextField(bounds.size)
        let size = placeholderLabelSize(boundsSize)
        let x = textFieldFrame.origin.x
        let y = textFieldFrame.origin.y + (textFieldFrame.size.height - size.height) / 2
        let origin = CGPoint(x: x, y: y)
        let frame = CGRect(origin: origin, size: size)
        return frame
    }
    private func layoutPlaceholderLabel(_ boundsSize: CGSize) -> CGRect {
        if isActive {
            return layoutPlaceholderLabelTop(boundsSize)
        } else {
            return layoutPlaceholderLabelCenter(boundsSize)
        }
    }
    
    func layoutUnderlineView(_ boundsSize: CGSize) -> CGRect {
        var frame = layoutTextField(boundsSize)
        frame.origin.y = frame.origin.y + frame.size.height
        frame.size.height = 1
        return frame
    }
    
    // MARK: Size
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let underlineViewFrame = layoutUnderlineView(size)
        var sizeThatFit = CGSize()
        sizeThatFit.width = size.width
        sizeThatFit.height = underlineViewFrame.origin.y + underlineViewFrame.size.height
        return sizeThatFit
    }
    
    // MARK: AUIResponsiveTextInputView
    
    private let animationDuration: TimeInterval = 0.25
    
    func responsiveTextInputViewDidBeginEditingEmpty(animated: Bool) {
        isActive = true
        updateState(animated: animated)
    }
    
    func responsiveTextInputViewDidBeginEditingNonempty(animated: Bool) {
        isActive = true
        updateState(animated: animated)
    }
    
    func responsiveTextInputViewDidBecomeEmpty(animated: Bool) {
        
    }
    
    func responsiveTextInputViewDidBecomeNonEmpty(animated: Bool) {
        
    }
    
    func responsiveTextInputViewDidEndEditingEmpty(animated: Bool) {
        isActive = false
        updateState(animated: animated)
    }
    
    func responsiveTextInputViewDidEndEditingNonempty(animated: Bool) {
        isActive = true
        updateState(animated: animated)
    }
    
}

class SignupPasswordTextFieldTextInputView: SignupTextFieldTextInputView {
    
    // MARK: Subviews
    
    let secureButton = UIButton()
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        addSubview(secureButton)
        setupSecureButton()
    }
    
    private func setupSecureButton() {
        secureButton.tintColor = .black
        secureButton.imageView?.contentMode = .scaleAspectFit
        if #available(iOS 13.0, *) {
            secureButton.tintColor = .black
            secureButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        secureButton.frame = layoutSecureButton(bounds.size)
    }
    
    private func layoutSecureButton(_ boundsSize: CGSize) -> CGRect {
        let textFieldPossibleSize = CGSize(width: boundsSize.width, height: boundsSize.height)
        let textFieldSize = textField.sizeThatFits(textFieldPossibleSize)
        let y = placeholderLabelSize(boundsSize).height + 1
        let width = textFieldSize.height + 8
        let height = textFieldSize.height + 8
        let x = bounds.width - width
        let frame = CGRect(x: x, y: y, width: width, height: height)
        return frame
    }
    
    override func layoutTextField(_ boundsSize: CGSize) -> CGRect {
        let x = layoutIconImageView(boundsSize).width + 8
        let y = placeholderLabelSize(boundsSize).height + 1
        let origin = CGPoint(x: x, y: y)
        let secureButtonFrame = layoutSecureButton(bounds.size)
        let width = boundsSize.width - x - secureButtonFrame.size.width
        let possibleSize = CGSize(width: width, height: boundsSize.height)
        var size = textField.sizeThatFits(possibleSize)
        size.width = width
        size.height = size.height + 8
        let frame = CGRect(origin: origin, size: size)
        return frame
    }
    
    override func layoutUnderlineView(_ boundsSize: CGSize) -> CGRect {
        var frame = layoutTextField(boundsSize)
        frame.origin.y = frame.origin.y + frame.size.height
        let secureButtonFrame = layoutSecureButton(bounds.size)
        frame.size.width += secureButtonFrame.size.width
        frame.size.height = 1
        return frame
    }
    
}
