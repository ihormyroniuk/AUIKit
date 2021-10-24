//
//  StringsdictScreenView.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 23.10.2021.
//

import UIKit
import AUIKit

class StringsdictScreenView: BackButtonTitleLabelScreenView {
    
    // MARK: Subviews
    
    let interactiveLabel = UILabel()
    
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
    
}
