import AUIKit

protocol TextFieldTextInputViewScreenControllerDelegate: AnyObject {
    func textFieldTextInputViewScreenControllerBack(_ textFieldTextInputViewScreenController: TextFieldTextInputViewScreenController)
}

class TextFieldTextInputViewScreenController: UIViewController {
    
    // MARK: Delegate
    
    weak var delegate: TextFieldTextInputViewScreenControllerDelegate?
    
    // MARK: View
    
    override func loadView() {
        view = TextFieldTextInputViewScreenView()
    }
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textInputViewTextFieldScreenView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        setContent()
        setupStringTextFieldTextInputView()
        setupDateTextFieldTextInputView()
        setupCountDownDurationTextFieldTextInputView()
    }
    
    private func setupStringTextFieldTextInputView() {
        let maximumLenghtTextInputValidator = AUIMaximumLenghtTextInputValidator(maximumLength: 10)
        let allowedCharactersTextInputValidator = AUIAllowedCharactersTextInputValidator(allowedCharacters: .letters)
        let inputTextValidator = AUIMultipleTextInputValidator(textInputValidators: [maximumLenghtTextInputValidator, allowedCharactersTextInputValidator])
        stringTextFieldController.textInputValidator = inputTextValidator
        stringTextFieldTextInputView.view = textInputViewTextFieldScreenView.stringTextFieldTextInputView
        stringTextFieldTextInputView.textFieldController = stringTextFieldController
        stringTextFieldController.keyboardType = .alphabet
    }
    
    private func setupDateTextFieldTextInputView() {
        dateDatePickerConroller.setDate(Date().addingTimeInterval(-10000000), animated: false)
        dateDatePickerConroller.valueChanged = { [weak self, weak dateDatePickerConroller] in
            guard let self = self else { return }
            guard let dateDatePickerConroller = dateDatePickerConroller else { return }
            let date = dateDatePickerConroller.date
            self.dateTextFieldController.text = "\(date)"
        }
        dateTextFieldController.inputViewController = dateDatePickerConroller
        dateTextFieldTextInputView.view = textInputViewTextFieldScreenView.dateTextFieldTextInputView
        dateTextFieldTextInputView.textFieldController = dateTextFieldController
    }
    
    private func setupCountDownDurationTextFieldTextInputView() {
        countDownDurationDatePickerConroller.countDownDuration = 60 * 60 * 7
        countDownDurationDatePickerConroller.valueChanged = { [weak self, weak countDownDurationDatePickerConroller] in
            guard let self = self else { return }
            guard let countDownDurationDatePickerConroller = countDownDurationDatePickerConroller else { return }
            let countDownDuration = countDownDurationDatePickerConroller.countDownDuration
            self.countDownDurationTextFieldController.text = "\(countDownDuration)"
        }
        countDownDurationDatePickerConroller.minuteInterval = 1
        countDownDurationTextFieldController.inputViewController = countDownDurationDatePickerConroller
        countDownDurationTextFieldTextInputView.view = textInputViewTextFieldScreenView.countDownDurationTextFieldTextInputView
        countDownDurationTextFieldTextInputView.textFieldController = countDownDurationTextFieldController
        countDownDurationTextFieldTextInputView.didBeginEditing = { [weak self, weak countDownDurationDatePickerConroller] in
            guard let self = self else { return }
            guard let countDownDurationDatePickerConroller = countDownDurationDatePickerConroller else { return }
            let countDownDuration = countDownDurationDatePickerConroller.countDownDuration
            self.countDownDurationTextFieldController.text = "\(countDownDuration)"
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
