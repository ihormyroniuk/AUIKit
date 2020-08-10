//
//  LabelsScreenView.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 23.07.2020.
//

import UIKit
import AUIKit

class LabelsScreenView: BackButtonTitleLabelScreenView {
    
    // MARK: Subviews
    
    let label = UILabel()
    let attributedLabel = AUIAttributedLabel()
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        backgroundColor = .white
        addSubview(label)
        setupLabel()
        addSubview(attributedLabel)
        setupAttributedLabel()
    }
    
    private func setupLabel() {
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.baselineAdjustment = .alignCenters
        label.backgroundColor = .green
    }
    
    private func setupAttributedLabel() {
        attributedLabel.backgroundColor = .green
        attributedLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        attributedLabel.numberOfLines = 0
        attributedLabel.lineBreakMode = .byTruncatingTail
        attributedLabel.underlineStyle = .single
        attributedLabel.underlineColor = .blue
        attributedLabel.textBackgroundColor = .red
        attributedLabel.strokeColor = .yellow
        attributedLabel.strokeWidth = 2
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutLabel()
        layoutAttributedLabel()
    }
    
    private func layoutLabel() {
        let x: CGFloat = 24
        let y: CGFloat = navigationBarView.frame.origin.y + navigationBarView.frame.size.height + 24
        let width: CGFloat = bounds.width - x * 2
        let possibleSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let height: CGFloat = label.sizeThatFits(possibleSize).height
        let frame = CGRect(x: x, y: y, width: width, height: height)
        label.frame = frame
    }
    
    private func layoutAttributedLabel() {
        let x: CGFloat = 24
        let y: CGFloat = label.frame.origin.y + label.frame.size.height + 24
        let width: CGFloat = bounds.width - x * 2
        let possibleSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let height: CGFloat = attributedLabel.sizeThatFits(possibleSize).height
        let frame = CGRect(x: x, y: y, width: width, height: height)
        attributedLabel.frame = frame
    }
    
}
