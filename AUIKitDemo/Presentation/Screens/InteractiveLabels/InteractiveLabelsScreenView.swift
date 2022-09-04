import AUIKit

class InteractiveLabelsScreenView: BackButtonTitleLabelScreenView {
    
    // MARK: Subviews
    
    let interactiveLabel = AUIInteractiveLabel()
    let textView = UITextView()
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        backgroundColor = .white
        addSubview(interactiveLabel)
        setupInteractiveLabel()
        addSubview(textView)
        setupTextView()
    }
    
    private func setupInteractiveLabel() {
        interactiveLabel.backgroundColor = .yellow
        interactiveLabel.lineBreakMode = .byTruncatingTail
        interactiveLabel.numberOfLines = 0
        //interactiveLabel.textAlignment = .center
    }
    
    private func setupTextView() {
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.dataDetectorTypes = .all
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutInteractiveLabel()
        layoutTextView()
    }
    
    private func layoutInteractiveLabel() {
        let x: CGFloat = 24
        let y: CGFloat = navigationBarView.frame.origin.y + navigationBarView.frame.size.height + 24
        let width: CGFloat = bounds.width - x * 2
        let possibleSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let height: CGFloat = interactiveLabel.sizeThatFits(possibleSize).height
        let frame = CGRect(x: x, y: y, width: possibleSize.width, height: height)
        interactiveLabel.frame = frame
    }
    
    private func layoutTextView() {
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainerInset = .zero
        let x: CGFloat = 24
        let y = interactiveLabel.frame.origin.y + interactiveLabel.frame.size.height + 24
        let origin = CGPoint(x: x, y: y)
        let width = bounds.size.width - x * 2
        let possibleSize = CGSize(width: width, height: bounds.size.height)
        var size = textView.sizeThatFits(possibleSize)
        size.width = width
        let frame = CGRect(origin: origin, size: size)
        textView.frame = frame
    }
    
    // MARK: Setters
    
    func setInteractiveLabelText(agree: String, termsAndConditions: (String, Any)) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let termsAndConditionsAttributes: [NSAttributedString.Key: Any] =
            [.font: UIFont.systemFont(ofSize: 18),
             .foregroundColor: UIColor.blue,
             .interaction: termsAndConditions.1,
             .paragraphStyle: paragraphStyle]
        let agreeTermsAndConditionsAttributes: [NSAttributedString.Key: Any] =
            [.font: UIFont.systemFont(ofSize: 18),
             .foregroundColor: UIColor.black,
             .paragraphStyle: paragraphStyle]
        let agreeTermsAndConditionsString = NSMutableAttributedString(string: agree, attributes: agreeTermsAndConditionsAttributes)
        if let range = agree.range(of: termsAndConditions.0) {
            let nsRange = NSRange(range, in: agreeTermsAndConditionsString.string)
            agreeTermsAndConditionsString.addAttributes(termsAndConditionsAttributes, range: nsRange)
        }
        self.interactiveLabel.attributedText = agreeTermsAndConditionsString
    }
    
    func setTextViewText(agree: String, termsAndConditions: (String, Any)) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let termsAndConditionsAttributes: [NSAttributedString.Key: Any] =
            [.font: UIFont.systemFont(ofSize: 18),
             .foregroundColor: UIColor.blue,
             .interaction: termsAndConditions.1,
             .paragraphStyle: paragraphStyle]
        let agreeTermsAndConditionsAttributes: [NSAttributedString.Key: Any] =
            [.font: UIFont.systemFont(ofSize: 18),
             .foregroundColor: UIColor.black,
             .paragraphStyle: paragraphStyle]
        let agreeTermsAndConditionsString = NSMutableAttributedString(string: agree, attributes: agreeTermsAndConditionsAttributes)
        if let range = agree.range(of: termsAndConditions.0) {
            let nsRange = NSRange(range, in: agreeTermsAndConditionsString.string)
            agreeTermsAndConditionsString.addAttributes(termsAndConditionsAttributes, range: nsRange)
        }
        self.textView.attributedText = agreeTermsAndConditionsString
    }
    
}
