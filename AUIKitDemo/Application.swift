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
        presentation.show()
    }
    
    // MARK: Presentation
    
    private lazy var presentation: Presentation = {
        let window = self.window ?? UIWindow()
        self.window = window
        let presentation = Presentation(window: window)
        presentation.window.makeKeyAndVisible()
        return presentation
    }()
    
}
