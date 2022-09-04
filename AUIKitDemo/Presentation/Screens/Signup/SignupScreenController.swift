import AUIKit

protocol SignupScreenControllerDelegate: AnyObject {
    func signupScreenControllerBack(_ signupScreenController: SignupScreenController)
}

class SignupScreenController: UIViewController {
    
    // MARK: Delegate
    
    weak var delegate: SignupScreenControllerDelegate?
    
    // MARK: View
    
    override func loadView() {
        view = SignupScreenView()
    }
    
    private var signupScreenView: SignupScreenView! {
        return view as? SignupScreenView
    }
    
    // MARK: Childs
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    private let usernameTextFieldController = AUITextInputFilterValidatorFormatterTextFieldController()
    private let usernameTextFieldTextInputController = AUIResponsiveTextFieldTextInputViewController()
    private let emailTextFieldController = AUITextInputFilterValidatorFormatterTextFieldController()
    private let emailTextFieldTextInputController = AUIResponsiveTextFieldTextInputViewController()
    private let birthdayDatePickerController = AUIEmptyDateTimePickerController()
    private let birthdayTextFieldController = AUITextInputFilterValidatorFormatterTextFieldController()
    private let birthdayTextFieldTextInputController = AUIResponsiveTextFieldTextInputViewController()
    private let passwordTextFieldController = AUITextInputFilterValidatorFormatterTextFieldController()
    private let passwordTextFieldTextInputController = AUIResponsiveTextFieldTextInputViewController()
    private let aboutMeTextViewController = AUITextInputFilterValidatorFormatterTextViewController()
    private let aboutMeTextViewTextInputController = AUIResponsiveTextViewTextInputViewController()
    
    // MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signupScreenView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        setupTapGestureRecognizer()
        setupUsernameTextInputController()
        setupEmailTextInputController()
        setupBirthdayTextInputController()
        setupPasswordTextInputController()
        setupPasswordTextInputController()
        setupAboutMeTextInputController()
        setupTermsOfServiceInteractiveLabel()
        setupSignUpButton()
        setContent()
        securePassword()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object:nil)
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
        let compositeTextInputValidator = AUIMultipleTextInputValidator(textInputValidators: textInputValidators)
        usernameTextFieldController.textInputValidator = compositeTextInputValidator
        usernameTextFieldController.keyboardType = .asciiCapable
        usernameTextFieldController.returnKeyType = .next
        usernameTextFieldTextInputController.textFieldController = usernameTextFieldController
        usernameTextFieldTextInputController.view = signupScreenView.usernameTextInputView
        usernameTextFieldTextInputController.didTapReturnKey = { [weak self] in
            guard let self = self else { return true }
            self.emailTextFieldController.becomeFirstResponder()
            return false
        }
    }
    
    private func setupEmailTextInputController() {
        emailTextFieldController.keyboardType = .emailAddress
        emailTextFieldController.returnKeyType = .next
        emailTextFieldTextInputController.textFieldController = emailTextFieldController
        emailTextFieldTextInputController.view = signupScreenView.emailTextInputView
        emailTextFieldTextInputController.didTapReturnKey = { [weak self] in
            guard let self = self else { return true }
            self.birthdayTextFieldController.becomeFirstResponder()
            return false
        }
    }
    
    private func setupBirthdayTextInputController() {
        birthdayDatePickerController.mode = .date
        birthdayDatePickerController.valueChanged = { [weak self] in
            guard let self = self else { return }
            self.setBirthdayTextFieldControllerText()
        }
        birthdayTextFieldController.inputViewController = birthdayDatePickerController
        birthdayTextFieldTextInputController.textFieldController = birthdayTextFieldController
        birthdayTextFieldTextInputController.view = signupScreenView.birthdayTextInputView
        birthdayTextFieldTextInputController.didBeginEditing = { [weak self] in
            guard let self = self else { return }
            self.setBirthdayTextFieldControllerText()
        }
    }
    
    private func setupPasswordTextInputController() {
        passwordTextFieldController.isSecureTextEntry = true
        passwordTextFieldController.returnKeyType = .go
        passwordTextFieldTextInputController.textFieldController = passwordTextFieldController
        passwordTextFieldTextInputController.view = signupScreenView.passwordTextInputView
        signupScreenView.securePasswordButton.addTarget(self, action: #selector(changeSecurePassword), for: .touchUpInside)
    }
    
    private func setupAboutMeTextInputController() {
        aboutMeTextViewController.isScrollEnabled = false
        aboutMeTextViewTextInputController.textViewController = aboutMeTextViewController
        aboutMeTextViewTextInputController.view = signupScreenView.aboutMeTextInputView
        aboutMeTextViewTextInputController.didChangeText = { [weak self] in
            guard let self = self else { return }
            self.signupScreenView.setNeedsLayout()
            self.signupScreenView.layoutIfNeeded()
        }
    }
    
    private func setupTermsOfServiceInteractiveLabel() {
        signupScreenView.termsOfServiceInteractiveLabel.addTarget(self, action: #selector(didInteractInteractiveLabel(_:_:)), for: .touchUpInside)
    }
    
    private func setupSignUpButton() {
        signupScreenView.signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    }
    
    // MARK: Events
    
    @objc private func didInteractInteractiveLabel(_ interactiveLabel: AUIInteractiveLabel, _ event: AUIInteractiveLabelEvent) {
        let interaction = event.interaction
        if signupScreenView.termsOfServiceInteractiveLabel == interactiveLabel {
            if interaction as? String == termsOfServicesInteraction {
                displayTermsOfServiceInteractiveLabel()
            }
        }
    }
    
    // MARK: Actions
    
    @objc private func back() {
        delegate?.signupScreenControllerBack(self)
    }
    
    private func setBirthdayTextFieldControllerText() {
        let date = birthdayDatePickerController.date
        birthdayTextFieldController.text = "\(date)"
    }
    
    @objc private func tapScreen() {
        view.endEditing(true)
    }
    
    @objc private func changeSecurePassword() {
        passwordTextFieldController.isSecureTextEntry = !passwordTextFieldController.isSecureTextEntry
        securePassword()
    }
    
    private func securePassword() {
        let secure = passwordTextFieldController.isSecureTextEntry
        signupScreenView.setPassword(secure: secure)
    }
    
    @objc private func displayTermsOfServiceInteractiveLabel() {
        print("displayTermsOfServiceInteractiveLabel")
    }
    
    @objc private func signUp() {
        let username = usernameTextFieldController.text
        let email = emailTextFieldController.text
        let password = passwordTextFieldController.text
        print("Username: \(String(describing: username))")
        print("Email: \(String(describing: email))")
        print("Password: \(String(describing: password))")
    }
    
    @objc private func keyboardWillChangeFrame(notification: NSNotification) {
        guard let height = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.origin.y else { return }
        guard let view = view else { return }
        view.frame.size.height = height
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }
    
    // MARK: Content
    
    private func setContent() {
        signupScreenView.titleLabel.text = "Signup"
        signupScreenView.usernameTextInputView.placeholderLabel.text = "Username"
        signupScreenView.emailTextInputView.placeholderLabel.text = "Email"
        signupScreenView.birthdayTextInputView.placeholderLabel.text = "Birthday"
        signupScreenView.passwordTextInputView.placeholderLabel.text = "Password"
        signupScreenView.aboutMeTextInputView.placeholderLabel.text = "About Me"
        signupScreenView.signUpButton.setTitle("Sign Up", for: .normal)
        setTermsOfServiceInteractiveLabelText()
    }

    private let termsOfServicesInteraction = "termsOfServicesInteraction"
    private func setTermsOfServiceInteractiveLabelText() {
        let interactiveText = "Terms of services"
        let text = String(format: "By creating an account, I agree to the %@ and to receive email offers at the email address I provided.", interactiveText)
        signupScreenView.setTermsOfServiceInteractiveLabelText(agree: text, termsAndConditions: (interactiveText, termsOfServicesInteraction))
    }
}
