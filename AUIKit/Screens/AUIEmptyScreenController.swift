//
//  AUIScreenController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 11/12/18.
//

import UIKit

open class AUIEmptyScreenController: UIViewController {
  
    // MARK: Initializers
  
    public init(view: UIView) {
        screenView = view
        super.init(nibName: nil, bundle: nil)
        setup()
    }
  
    @available(*, unavailable)
    public convenience required init?(coder aDecoder: NSCoder) {
        return nil
    }
  
    // MARK: Setup
  
    open func setup() {
    
    }
  
    // MARK: Life Cycle
  
    private let screenView: UIView
    open override func loadView() {
        self.view = screenView
    }
  
}

