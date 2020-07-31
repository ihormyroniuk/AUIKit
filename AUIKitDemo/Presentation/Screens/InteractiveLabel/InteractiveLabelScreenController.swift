//
//  InteractiveLabelScreenController.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 22.07.2020.
//

import UIKit
import AUIKit

class InteractiveLabelScreenController: AUIDefaultScreenController {
    
    // MARK: View
    
    private var interactiveLabelScreenView: InteractiveLabelScreenView! {
        return view as? InteractiveLabelScreenView
    }
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        interactiveLabelScreenView.interactiveLabel.addTarget(self, action: #selector(interactiveLabelTouchUpInsideEventAction), for: .touchUpInside)
        setContent()
    }
    
    // MARK: Events
    
    @objc private func interactiveLabelTouchUpInsideEventAction(_ key: Any?) {
        
    }
    
    // MARK: Content
    
    private func setContent() {
        setInteractiveLabelText()
    }
    
    private func setInteractiveLabelText() {
        let interactiveText = "Terms & Conditions"
        let text = String(format: "By creating an account, I agree to the %@ and to receive email offers at the email address I provided.", interactiveText)
        interactiveLabelScreenView.setInteractiveLabelText(agree: text, termsAndConditions: (interactiveText, "ffff"))
    }
    
}
