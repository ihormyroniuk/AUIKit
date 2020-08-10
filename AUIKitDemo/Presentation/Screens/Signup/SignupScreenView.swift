//
//  SignupScreenView.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 04.08.2020.
//

import UIKit
import AUIKit

class SignupScreenView: BackButtonTitleLabelScreenView {
    
    // MARK: Subviews
    
    let scrollView = UIScrollView()
    let usernameTextInputView = SignupTextFieldTextInputView()
    let emailTextInputView = SignupTextFieldTextInputView()
    let birthdayTextInputView = SignupTextFieldTextInputView()
    let passwordTextInputView = SignupRightButtonTextFieldTextInputView()
    var securePasswordButton: UIButton {
        return passwordTextInputView.rightButton
    }
    let aboutMeTextInputView = SignupTextViewTextInputView()
    let termsOfServiceInteractiveLabel = AUIInteractiveLabel()
    let signUpButton = FilledRoundedButton()
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(usernameTextInputView)
        setupUsernameTextInputView()
        scrollView.addSubview(emailTextInputView)
        setupEmailTextInputView()
        scrollView.addSubview(birthdayTextInputView)
        setupBirthdayTextInputView()
        scrollView.addSubview(passwordTextInputView)
        setupPasswordTextInputView()
        scrollView.addSubview(aboutMeTextInputView)
        setupAboutMeTextInputView()
        scrollView.addSubview(termsOfServiceInteractiveLabel)
        setupTermsOfServiceInteractiveLabel()
        scrollView.addSubview(signUpButton)
    }
    
    private func setupUsernameTextInputView() {
        if #available(iOS 13.0, *) {
            usernameTextInputView.iconImageView.image = UIImage(systemName: "person.fill")
            usernameTextInputView.iconImageView.tintColor = .black
        }
    }
    
    private func setupEmailTextInputView() {
        if #available(iOS 13.0, *) {
            emailTextInputView.iconImageView.image = UIImage(systemName: "envelope.fill")
            emailTextInputView.iconImageView.tintColor = .black
        }
    }
    
    private func setupBirthdayTextInputView() {
        let datePicker = UIDatePicker()
        birthdayTextInputView.textField.inputView = datePicker
        if #available(iOS 13.0, *) {
            birthdayTextInputView.iconImageView.image = UIImage(systemName: "calendar.circle.fill")
            birthdayTextInputView.iconImageView.tintColor = .black
        }
    }
    
    private func setupPasswordTextInputView() {
        if #available(iOS 13.0, *) {
            passwordTextInputView.iconImageView.image = UIImage(systemName: "lock.fill")
            passwordTextInputView.iconImageView.tintColor = .black
        }
    }
    
    private func setupAboutMeTextInputView() {
        
    }
    
    private func setupTermsOfServiceInteractiveLabel() {
        termsOfServiceInteractiveLabel.numberOfLines = 0
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutScrollView()
        layoutUsernameTextInputView()
        layoutEmailTextInputView()
        layoutBirthdayTextInputView()
        layoutPasswordTextInputView()
        layoutAboutMeTextInputView()
        layoutTermsOfServiceInteractiveLabel()
        layoutSignUpButton()
        setScrollViewContentSize()
    }
    
    private func layoutScrollView() {
        let x: CGFloat = 0
        let y = navigationBarView.frame.origin.y + navigationBarView.frame.size.height
        let width = bounds.width
        let height = bounds.height - y
        let frame = CGRect(x: x, y: y, width: width, height: height)
        scrollView.frame = frame
    }
    
    private func layoutUsernameTextInputView() {
        let x: CGFloat = 24
        let y: CGFloat = 24
        let origin = CGPoint(x: x, y: y)
        let width = bounds.width - 2 * x
        let possibleHeight = CGFloat.greatestFiniteMagnitude
        let possibleSize = CGSize(width: width, height: possibleHeight)
        let size = usernameTextInputView.sizeThatFits(possibleSize)
        let frame = CGRect(origin: origin, size: size)
        usernameTextInputView.frame = frame
    }
    
    private func layoutEmailTextInputView() {
        let x: CGFloat = 24
        let y = usernameTextInputView.frame.origin.y + usernameTextInputView.frame.size.height + 24
        let origin = CGPoint(x: x, y: y)
        let width = bounds.width - 2 * x
        let possibleHeight = CGFloat.greatestFiniteMagnitude
        let possibleSize = CGSize(width: width, height: possibleHeight)
        let size = emailTextInputView.sizeThatFits(possibleSize)
        let frame = CGRect(origin: origin, size: size)
        emailTextInputView.frame = frame
    }
    
    private func layoutBirthdayTextInputView() {
        let x: CGFloat = 24
        let y = emailTextInputView.frame.origin.y + emailTextInputView.frame.size.height + 24
        let origin = CGPoint(x: x, y: y)
        let width = bounds.width - 2 * x
        let possibleHeight = CGFloat.greatestFiniteMagnitude
        let possibleSize = CGSize(width: width, height: possibleHeight)
        let size = birthdayTextInputView.sizeThatFits(possibleSize)
        let frame = CGRect(origin: origin, size: size)
        birthdayTextInputView.frame = frame
    }
    
    private func layoutPasswordTextInputView() {
        let x: CGFloat = 24
        let y = birthdayTextInputView.frame.origin.y + birthdayTextInputView.frame.size.height + 24
        let origin = CGPoint(x: x, y: y)
        let width = bounds.width - 2 * x
        let possibleHeight = CGFloat.greatestFiniteMagnitude
        let possibleSize = CGSize(width: width, height: possibleHeight)
        let size = passwordTextInputView.sizeThatFits(possibleSize)
        let frame = CGRect(origin: origin, size: size)
        passwordTextInputView.frame = frame
    }
    
    private func layoutAboutMeTextInputView() {
        let x: CGFloat = 24
        let y = passwordTextInputView.frame.origin.y + passwordTextInputView.frame.size.height + 24
        let origin = CGPoint(x: x, y: y)
        let width = bounds.width - 2 * x
        let possibleHeight = CGFloat.greatestFiniteMagnitude
        let possibleSize = CGSize(width: width, height: possibleHeight)
        let size = aboutMeTextInputView.sizeThatFits(possibleSize)
        let frame = CGRect(origin: origin, size: size)
        aboutMeTextInputView.frame = frame
    }
    
    private func layoutTermsOfServiceInteractiveLabel() {
        let x: CGFloat = 24
        let y = aboutMeTextInputView.frame.origin.y + aboutMeTextInputView.frame.size.height + 24
        let origin = CGPoint(x: x, y: y)
        let width = bounds.width - 2 * x
        let possibleHeight = CGFloat.greatestFiniteMagnitude
        let possibleSize = CGSize(width: width, height: possibleHeight)
        let size = termsOfServiceInteractiveLabel.sizeThatFits(possibleSize)
        let frame = CGRect(origin: origin, size: size)
        termsOfServiceInteractiveLabel.frame = frame
    }
    
    private func layoutSignUpButton() {
        let x: CGFloat = 24
        let y = termsOfServiceInteractiveLabel.frame.origin.y + termsOfServiceInteractiveLabel.frame.size.height + 24
        let origin = CGPoint(x: x, y: y)
        let width = bounds.width - 2 * x
        let possibleHeight = CGFloat.greatestFiniteMagnitude
        let possibleSize = CGSize(width: width, height: possibleHeight)
        let size = signUpButton.sizeThatFits(possibleSize)
        let frame = CGRect(origin: origin, size: size)
        signUpButton.frame = frame
    }
    
    private func setScrollViewContentSize() {
        let width = bounds.width
        let height: CGFloat = signUpButton.frame.origin.y + signUpButton.frame.size.height + 24
        let contentSize = CGSize(width: width, height: height)
        scrollView.contentSize = contentSize
    }
    
    // MARK: Setters
    
    func setPassword(secure: Bool) {
        if #available(iOS 13.0, *) {
            if secure {
                passwordTextInputView.rightButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            } else {
                passwordTextInputView.rightButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            }
        }
    }
    
    func setTermsOfServiceInteractiveLabelText(agree: String, termsAndConditions: (String, String)) {
        let termsAndConditionsAttributes: [NSAttributedString.Key: Any] =
            [.font: UIFont.systemFont(ofSize: 13),
             .foregroundColor: UIColor.blue,
             .interaction: termsAndConditions.1]
        let agreeTermsAndConditionsAttributes: [NSAttributedString.Key: Any] =
            [.font: UIFont.systemFont(ofSize: 13),
             .foregroundColor: UIColor.black]
        let agreeTermsAndConditionsString = NSMutableAttributedString(string: agree, attributes: agreeTermsAndConditionsAttributes)
        if let range = agree.range(of: termsAndConditions.0) {
            let nsRange = NSRange(range, in: agreeTermsAndConditionsString.string)
            agreeTermsAndConditionsString.addAttributes(termsAndConditionsAttributes, range: nsRange)
        }
        self.termsOfServiceInteractiveLabel.attributedText = agreeTermsAndConditionsString
    }
}
