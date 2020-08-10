//
//  InteractiveLabelScreenView.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 22.07.2020.
//

import UIKit
import AUIKit

class InteractiveLabelsScreenView: BackButtonTitleLabelScreenView {
    
    // MARK: Subviews
    
    let interactiveLabel = AUIInteractiveLabel()
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        backgroundColor = .white
        addSubview(interactiveLabel)
        setupInteractiveLabel()
    }
    
    private func setupInteractiveLabel() {
        interactiveLabel.lineBreakMode = .byTruncatingTail
        interactiveLabel.numberOfLines = 0
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutInteractiveLabel()
    }
    
    private func layoutInteractiveLabel() {
        let x: CGFloat = 24
        let y: CGFloat = navigationBarView.frame.origin.y + navigationBarView.frame.size.height + 24
        let width: CGFloat = bounds.width - x * 2
        let possibleSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let height: CGFloat = interactiveLabel.sizeThatFits(possibleSize).height
        let frame = CGRect(x: x, y: y, width: width, height: height)
        interactiveLabel.frame = frame
    }
    
    // MARK: Setters
    
    func setInteractiveLabelText(agree: String, termsAndConditions: (String, String)) {
        let termsAndConditionsAttributes: [NSAttributedString.Key: Any] =
            [.font: UIFont.systemFont(ofSize: 18),
             .foregroundColor: UIColor.blue,
             .interaction: termsAndConditions.1]
        let agreeTermsAndConditionsAttributes: [NSAttributedString.Key: Any] =
            [.font: UIFont.systemFont(ofSize: 18),
             .foregroundColor: UIColor.black]
        let agreeTermsAndConditionsString = NSMutableAttributedString(string: agree, attributes: agreeTermsAndConditionsAttributes)
        if let range = agree.range(of: termsAndConditions.0) {
            let nsRange = NSRange(range, in: agreeTermsAndConditionsString.string)
            agreeTermsAndConditionsString.addAttributes(termsAndConditionsAttributes, range: nsRange)
        }
        self.interactiveLabel.attributedText = agreeTermsAndConditionsString
    }
    
}
