//
//  IntroScreenView.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 01.04.2021.
//

import UIKit
import AUIKit

class IntroScreenView: BackButtonTitleLabelScreenView {
    
    // MARK: Subviews
    
    let pagesView = UIView()
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        backgroundColor = .white
        addSubview(pagesView)
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutPagesView()
    }
    
    private func layoutPagesView() {
        let x: CGFloat = 0
        let y = navigationBarView.frame.origin.y + navigationBarView.frame.size.height
        let width = bounds.width
        let height = bounds.height - y
        let frame = CGRect(x: x, y: y, width: width, height: height)
        pagesView.frame = frame
    }
    
}
