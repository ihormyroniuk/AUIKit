//
//  TitledScreenView.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 05.08.2020.
//

import UIKit
import AUIKit

class TitleLabelScreenView: NavigationBarScreenView {
    
    // MARK: Elements
    
    let titleLabel = UILabel()

    // MARK: Setup
    
    override func setup() {
        super.setup()
        navigationBarView.addSubview(titleLabel)
        setupTitleLabel()
    }
    
    func setupTitleLabel() {
        
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutTitleLabel()
    }
    
    func layoutTitleLabel() {
        let x: CGFloat = 0
        let y = statusBarView.frame.origin.y + statusBarView.frame.size.height
        let width = bounds.width
        let height: CGFloat = 44
        titleLabel.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
}

