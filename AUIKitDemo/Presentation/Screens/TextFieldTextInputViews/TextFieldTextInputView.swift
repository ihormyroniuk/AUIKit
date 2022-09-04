import AUIKit

class TextFieldTextInputView: AUIView, AUITextFieldTextInputView, AUIResponsiveTextInputView {
    
    // MARK: Subviews AUITextFieldTextInputView
    
    let textField = UITextField()
    let placeholderLabel = UILabel()
    let underlineView = UIView()
    
    // MARK: States
    
    private var isActive = false
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        addSubview(textField)
        addSubview(placeholderLabel)
        setupPlaceholderLabel()
        addSubview(underlineView)
        setupUnderlineView()
    }
    
    private func setupPlaceholderLabel() {
        placeholderLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        if isActive {
            placeholderLabel.textColor = .black
        } else {
            placeholderLabel.textColor = .lightGray
        }
    }
    
    private func setupUnderlineView() {
        if isActive {
            underlineView.backgroundColor = .black
        } else {
            underlineView.backgroundColor = .lightGray
        }
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        placeholderLabel.frame = layoutPlaceholderLabel(bounds.size)
        textField.frame = layoutTextField(bounds.size)
        underlineView.frame = layoutUnderlineView(bounds.size)
    }
    
    private func layoutTextField(_ boundsSize: CGSize) -> CGRect {
        let x: CGFloat = 0
        let y = placeholderLabelSize(boundsSize).height + 1
        let origin = CGPoint(x: x, y: y)
        let width = boundsSize.width
        let possibleSize = CGSize(width: width, height: boundsSize.height)
        var size = textField.sizeThatFits(possibleSize)
        size.width = boundsSize.width
        size.height = size.height + 8
        let frame = CGRect(origin: origin, size: size)
        return frame
    }
    
    private func placeholderLabelSize(_ boundsSize: CGSize) -> CGSize {
        let possibleWidth = bounds.width
        let possibleHeight = CGFloat.greatestFiniteMagnitude
        let possibleSize = CGSize(width: possibleWidth, height: possibleHeight)
        let size = placeholderLabel.sizeThatFits(possibleSize)
        return size
    }
    private func layoutPlaceholderLabelTop(_ boundsSize: CGSize) -> CGRect {
        let x: CGFloat = 0
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
    
    private func layoutUnderlineView(_ boundsSize: CGSize) -> CGRect {
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
    
    func responsiveTextInputViewDidBeginEditingNonempty(animated: Bool) {
        isActive = true
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
    
    func responsiveTextInputViewDidBecomeEmpty(animated: Bool) {
        
    }
    
    func responsiveTextInputViewDidBecomeNonEmpty(animated: Bool) {
        
    }
    
    func responsiveTextInputViewDidEndEditingEmpty(animated: Bool) {
        isActive = false
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
    
    func responsiveTextInputViewDidEndEditingNonempty(animated: Bool) {
        isActive = true
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
    
    
}
