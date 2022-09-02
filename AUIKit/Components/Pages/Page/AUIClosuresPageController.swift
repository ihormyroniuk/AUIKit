//
//  AUIClosuresPageController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 26.12.2021.
//

import UIKit

open class AUIClosuresPageController: AUIEmptyPageController {
  
    open var viewControllerClosure: (() -> UIViewController)?
    public override var viewController: UIViewController {
        return viewControllerClosure?() ?? UIViewController()
    }
    
}
