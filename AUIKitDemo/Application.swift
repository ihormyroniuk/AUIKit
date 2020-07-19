//
//  Application.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 19.07.2020.
//

import UIKit
import AUIKit

class Application: AUIEmptyApplication {
    
    override func didFinishLaunching() {
        super.didFinishLaunching()
        let viewController = UIViewController()
        viewController.view.backgroundColor = .green
        if window == nil {
            window = UIWindow()
        }
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
    
}
