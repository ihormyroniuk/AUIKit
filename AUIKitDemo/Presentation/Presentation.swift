//
//  Presentation.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 21.07.2020.
//

import UIKit
import AUIKit

class Presentation: AUIWindowPresentation {
    
    func show() {
//        let screenView = InteractiveLabelScreenView()
//        let screenController = InteractiveLabelScreenController(view: screenView)
        
//        let screenView = LabelsScreenView()
//        let screenController = LabelsScreenController(view: screenView)
        
        let screenView = TextInputViewTextFieldScreenView()
        let screenController = TextInputViewTextFieldScreenController(view: screenView)
        
        window.rootViewController = screenController
    }
    
}
