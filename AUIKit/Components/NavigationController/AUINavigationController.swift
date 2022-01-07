//
//  AUINavigationController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 9/22/19.
//

import UIKit

open class AUINavigationController: UINavigationController, UIGestureRecognizerDelegate {

    // MARK: Initializer
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    @available(*, unavailable)
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    open func setup() {
        setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: Events
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.isEnabled = true
        interactivePopGestureRecognizer?.delegate = self
    }
    
    // MARK: UIGestureRecognizerDelegate
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if interactivePopGestureRecognizer == gestureRecognizer {
            return viewControllers.count > 1
        }
        return true
    }

}
