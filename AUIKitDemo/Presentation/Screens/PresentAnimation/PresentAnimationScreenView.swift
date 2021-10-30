//
//  PresentAnimationScreenView.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 24.10.2021.
//
import UIKit
import AUIKit

class PresentAnimationScreenView: AUIView {
    
    // MARK: Subviews
    
    let contentView = UIView()
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        backgroundColor = .green
        addSubview(contentView)
        setupContentView()
    }
    
    private func setupContentView() {
        contentView.backgroundColor = .red
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutContentView()
    }
    
    private func layoutContentView() {
        let x: CGFloat = 16
        let y: CGFloat = 16
        let width = bounds.width - x * 2
        let height: CGFloat = 400
        let frame = CGRect(x: x, y: y, width: width, height: height)
        contentView.frame = frame
    }
    
    // MARK: Size
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let sizeThatFitsWidth = size.width
        let sizeThatFitsHeight: CGFloat = 400 + 32
        let sizeThatFits = CGSize(width: sizeThatFitsWidth, height: sizeThatFitsHeight)
        return sizeThatFits
    }
    
}
