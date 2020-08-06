//
//  SignupScreenController.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 04.08.2020.
//

import UIKit
import AUIKit

class SignupScreenController: AUIEmptyScreenController, AUITextFieldControllerDidBeginEditingObserver, AUIControlControllerDidValueChangedObserver, AUITextFieldControllerDidTapReturnKeyObserver {
    
    // MARK: View
    
    private var signupScreenView: SignupScreenView! {
        return view as? SignupScreenView
    }
    
    // MARK: Childs
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    private let usernameTextFieldController = AUITextInputFilterValidatorFormatterTextFieldController()
    private let usernameTextFieldTextInputController = AUIResponsiveTextFieldTextInputViewController()
    private let emailTextFieldController = AUITextInputFilterValidatorFormatterTextFieldController()
    private let emailTextFieldTextInputController = AUIResponsiveTextFieldTextInputViewController()
    private let birthdayDatePickerController = AUIEmptyDatePickerController()
    private let birthdayTextFieldController = AUITextInputFilterValidatorFormatterTextFieldController()
    private let birthdayTextFieldTextInputController = AUIResponsiveTextFieldTextInputViewController()
    private let passwordTextFieldController = AUITextInputFilterValidatorFormatterTextFieldController()
    private let passwordTextFieldTextInputController = AUIResponsiveTextFieldTextInputViewController()
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        setupTapGestureRecognizer()
        setupUsernameTextInputController()
        setupEmailTextInputController()
        setupBirthdayTextInputController()
        setupPasswordTextInputController()
        setupSignUpButton()
        setContent()
    }
    
    private func setupTapGestureRecognizer() {
        view.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.addTarget(self, action: #selector(tapScreen))
    }
    
    private func setupUsernameTextInputController() {
        let maximumLength: UInt = 24
        let maximumLenghtTextInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: maximumLength)
        let allowedCharacters = CharacterSet.lowercaseLetters
        let allowedCharactersTextInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: allowedCharacters)
        let textInputValidators: [AUITextInputValidator] = [maximumLenghtTextInputValidator, allowedCharactersTextInputValidator]
        let compositeTextInputValidator = AUICompositeTextInputValidator(textInputValidators: textInputValidators)
        usernameTextFieldController.textInputValidator = compositeTextInputValidator
        usernameTextFieldController.keyboardType = .asciiCapable
        usernameTextFieldController.returnKeyType = .next
        usernameTextFieldController.addDidTapReturnKeyObserver(self)
        usernameTextFieldTextInputController.textFieldController = usernameTextFieldController
        usernameTextFieldTextInputController.view = signupScreenView.usernameTextInputView
    }
    
    private func setupEmailTextInputController() {
        emailTextFieldController.keyboardType = .emailAddress
        emailTextFieldController.returnKeyType = .next
        emailTextFieldController.addDidTapReturnKeyObserver(self)
        emailTextFieldTextInputController.textFieldController = emailTextFieldController
        emailTextFieldTextInputController.view = signupScreenView.emailTextInputView
    }
    
    private func setupBirthdayTextInputController() {
        birthdayDatePickerController.mode = .date
        birthdayDatePickerController.addDidValueChangedObserver(self)
        birthdayTextFieldController.inputViewController = birthdayDatePickerController
        birthdayTextFieldController.addDidBeginEditingObserver(self)
        birthdayTextFieldTextInputController.textFieldController = birthdayTextFieldController
        birthdayTextFieldTextInputController.view = signupScreenView.birthdayTextInputView
    }
    
    private func setupPasswordTextInputController() {
        passwordTextFieldController.isSecureTextEntry = true
        passwordTextFieldController.returnKeyType = .go
        passwordTextFieldController.addDidTapReturnKeyObserver(self)
        passwordTextFieldTextInputController.textFieldController = passwordTextFieldController
        passwordTextFieldTextInputController.view = signupScreenView.passwordTextInputView
        signupScreenView.securePasswordButton.addTarget(self, action: #selector(securePassword), for: .touchUpInside)
    }
    
    private func setupSignUpButton() {
        signupScreenView.signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    }
    
    // MARK: Events
    
    func textFieldControllerDidBeginEditing(_ textFieldController: AUITextFieldController) {
        if birthdayTextFieldController === textFieldController {
            birthdayTextFieldControllerDidBeginEditing()
        }
    }
    
    private func birthdayTextFieldControllerDidBeginEditing() {
        setBirthdayTextFieldControllerText()
    }
    
    func controlControllerDidValueChanged(_ controlController: AUIControlController) {
        if birthdayDatePickerController === controlController {
            setBirthdayTextFieldControllerText()
        }
    }
    
    func textFieldControllerDidTapReturnKey(_ textFieldController: AUITextFieldController) {
        if usernameTextFieldController === textFieldController {
            emailTextFieldController.becomeFirstResponder()
        } else if emailTextFieldController === textFieldController {
            birthdayTextFieldController.becomeFirstResponder()
        } else if passwordTextFieldController === textFieldController {
            
        }
    }
    
    // MARK: Actions
    
    private func setBirthdayTextFieldControllerText() {
        let date = birthdayDatePickerController.date
        birthdayTextFieldController.text = "\(date)"
    }
    
    @objc private func tapScreen() {
        view.endEditing(true)
    }
    
    @objc private func securePassword() {
        let secure = !passwordTextFieldController.isSecureTextEntry
        passwordTextFieldController.isSecureTextEntry = secure
        self.signupScreenView.setPassword(secure: secure)
    }
    
    @objc private func signUp() {
        let username = usernameTextFieldController.text
        let email = emailTextFieldController.text
        let password = passwordTextFieldController.text
        print("Username: \(username)")
        print("Email: \(email)")
        print("Password: \(password)")
    }
    
    // MARK: Content
    
    private func setContent() {
        signupScreenView.titleLabel.text = "Signup"
        signupScreenView.usernameTextInputView.placeholderLabel.text = "Username"
        signupScreenView.emailTextInputView.placeholderLabel.text = "Email"
        signupScreenView.birthdayTextInputView.placeholderLabel.text = "Birthday"
        signupScreenView.passwordTextInputView.placeholderLabel.text = "Password"
        signupScreenView.signUpButton.setTitle("Sign Up", for: .normal)
        setTermsOfServiceInteractiveLabelText()
    }

    private func setTermsOfServiceInteractiveLabelText() {
        let interactiveText = "Terms of services"
        let text = String(format: "By creating an account, I agree to the %@ and to receive email offers at the email address I provided.", interactiveText)
        signupScreenView.setTermsOfServiceInteractiveLabelText(agree: text, termsAndConditions: (interactiveText, "ffff"))
    }
}
