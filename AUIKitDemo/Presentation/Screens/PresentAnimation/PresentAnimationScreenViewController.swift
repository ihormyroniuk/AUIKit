//
//  PresentAnimationScreenViewController.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 24.10.2021.
//

import UIKit
import AUIKit

class PresentAnimationScreenViewController: UIViewController {

    // MARK: View
    
    override func loadView() {
        view = PresentAnimationScreenView()
    }
    
    private var presentAnimationScreenView: PresentAnimationScreenView! {
        return view as? PresentAnimationScreenView
    }
    
}
