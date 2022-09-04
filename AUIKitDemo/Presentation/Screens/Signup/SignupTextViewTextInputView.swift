import AUIKit

class SignupTextViewTextInputView: AUIView, AUITextViewTextInputView, AUIResponsiveTextInputView {
    
    // MARK: Subviews
    
    let placeholderLabel = UILabel()
    let textView = UITextView()
    let underlineView = UIView()
    
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
        addSubview(textView)
        setupTextView()
        addSubview(underlineView)
        setupUnderlineView()
        addSubview(placeholderLabel)
        setupPlaceholderLabel()
    }
    
    private func setupTextView() {
        textView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textView.tintColor = .black
        textView.isScrollEnabled = false
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
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
        placeholderLabel.frame = layoutPlaceholderLabel(bounds.size)
        textView.frame = layoutTextView(bounds.size)
        underlineView.frame = layoutUnderlineView(bounds.size)
    }
    
    func layoutTextView(_ boundsSize: CGSize) -> CGRect {
        let x: CGFloat = 0
        let y = placeholderLabelSize(boundsSize).height + 1
        let origin = CGPoint(x: x, y: y)
        let width = boundsSize.width - x
        let possibleSize = CGSize(width: width, height: boundsSize.height)
        var size = textView.sizeThatFits(possibleSize)
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
        let textFieldFrame = layoutTextView(bounds.size)
        let x = textFieldFrame.origin.x
        let y: CGFloat = 0
        let origin = CGPoint(x: x, y: y)
        let size = placeholderLabelSize(boundsSize)
        let frame = CGRect(origin: origin, size: size)
        return frame
    }
    private func layoutPlaceholderLabelCenter(_ boundsSize: CGSize) -> CGRect {
        let textFieldFrame = layoutTextView(bounds.size)
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
        var frame = layoutTextView(boundsSize)
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
