//
//  PresentAnimationScreenView.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 24.10.2021.
//
import UIKit
import AUIKit

class PresentAnimationScreenView: AUIView {
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        backgroundColor = .green
    }
    
    // MARK: Size
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let sizeThatFitsWidth = size.width
        let sizeThatFitsHeight = size.height * 0.85
        let sizeThatFits = CGSize(width: sizeThatFitsWidth, height: sizeThatFitsHeight)
        return sizeThatFits
    }
    
}
