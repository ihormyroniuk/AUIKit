//
//  NavigationBarScreenView.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 04.08.2020.
//

import AUIKit

class NavigationBarScreenView: AUIStatusBarScreenView {
    
    // MARK: Elements
    
    let navigationBarView: UIView
    
    // MARK: Initializer
    
    init(frame: CGRect = .zero, statusBarView: UIView = UIView(), navigationBarView: UIView = UIView()) {
        self.navigationBarView = navigationBarView
        super.init(frame: frame, statusBarView: statusBarView)
    }

    // MARK: Setup
    
    override func setup() {
        super.setup()
        addSubview(navigationBarView)
        setupNavigationBarView()
    }
    
    func setupNavigationBarView() {
        
    }
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutNavigationBarView()
    }
    
    func layoutNavigationBarView() {
        let x: CGFloat = 0
        let y = statusBarView.frame.origin.y + statusBarView.frame.size.height
        let width = bounds.width
        let height: CGFloat = 44
        navigationBarView.frame = CGRect(x: x, y: y, width: width, height: height)
    }
    
}
