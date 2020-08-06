//
//  Presentation.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 21.07.2020.
//

import UIKit
import AUIKit

class Presentation: AUIWindowPresentation {
    
    // MARK: Setup
    
    public override func setup() {
        super.setup()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object:nil)
    }
    
    // MARK: Keyboard
    
    @objc private func keyboardWillChangeFrame(notification: NSNotification) {
        let height = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.origin.y
        guard let view = window.rootViewController?.view else { return }
        view.frame.size.height = height
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }
    
    func show() {
//        let screenView = InteractiveLabelScreenView()
//        let screenController = InteractiveLabelScreenController(view: screenView)
        
//        let screenView = LabelsScreenView()
//        let screenController = LabelsScreenController(view: screenView)
        
//        let screenView = TextInputViewTextFieldScreenView()
//        let screenController = TextInputViewTextFieldScreenController(view: screenView)
        
        let screenView = SignupScreenView()
        let screenController = SignupScreenController(view: screenView)
        
        window.rootViewController = screenController
    }
    
}
