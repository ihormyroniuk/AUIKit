//
//  LabelsScreenViewController.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 23.07.2020.
//

import UIKit
import AUIKit

class LabelsScreenController: AUIDefaultScreenController {
    
    // MARK: View
    
    private var labelScreenView: LabelsScreenView! {
        return view as? LabelsScreenView
    }
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        setContent()
    }
    
    // MARK: Content
    
    private func setContent() {
        let text = "I've seen things you people wouldn't believe. Attack ships on fire off the shoulder of Orion. I watched C–beams glitter in the darkness at Tannhauser Gate. All those moments will be lost in time like tears in rain. Time to die."
        labelScreenView.label.text = text
        labelScreenView.attributedLabel.text = text
    }
    
}
