//
//  Presentation.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 21.07.2020.
//

import UIKit
import AUIKit

class Presentation: AUIWindowPresentation, MenuScreenControllerDelegate, InteractiveLabelsScreenControllerDelegate, LabelsScreenControllerDelegate, SignupScreenControllerDelegate, TextFieldTextInputViewScreenControllerDelegate {
    
    // MARK: Setup
    
    public override func setup() {
        super.setup()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object:nil)
    }
    
    // MARK: Display
    
    func display() {
            let screenView = MenuScreenView()
            let screenController = MenuScreenController(view: screenView)
            screenController.delegate = self
            
            let navigationController = AUINavigationController()
            navigationController.viewControllers = [screenController]
        
            mainNavigationController = navigationController
            menuScreenController = screenController
            window.rootViewController = mainNavigationController
            window.makeKeyAndVisible()
        }
    
    // MARK: Main Navigation Controller
    
    private weak var mainNavigationController: AUINavigationController?
    
    // MARK: Menu Screen Controller
    
    private weak var menuScreenController: MenuScreenController?
    
    func menuScreenControllerDisplayLabelsScreen(_ menuScreenController: MenuScreenController) {
        let screenView = LabelsScreenView()
        let screenController = LabelsScreenController(view: screenView)
        screenController.delegate = self
        labelsScreenController = screenController
        mainNavigationController?.pushViewController(screenController, animated: true)
    }
    
    func menuScreenControllerDisplayInteractiveLabelsScreen(_ menuScreenController: MenuScreenController) {
        let screenView = InteractiveLabelsScreenView()
        let screenController = InteractiveLabelsScreenController(view: screenView)
        screenController.delegate = self
        interactiveLabelScreenController = screenController
        mainNavigationController?.pushViewController(screenController, animated: true)
    }
    
    func menuScreenControllerDisplaySignupScreen(_ menuScreenController: MenuScreenController) {
        let screenView = SignupScreenView()
        let screenController = SignupScreenController(view: screenView)
        screenController.delegate = self
        signupScreenController = screenController
        mainNavigationController?.pushViewController(screenController, animated: true)
    }
    
    func menuScreenControllerDisplayTextFieldTextInputViewScreen(_ menuScreenController: MenuScreenController) {
        let screenView = TextFieldTextInputViewScreenView()
        let screenController = TextFieldTextInputViewScreenController(view: screenView)
        screenController.delegate = self
        textFieldTextInputViewScreenController = screenController
        mainNavigationController?.pushViewController(screenController, animated: true)
    }
    
    // MARK: Labels Screen
    
    private weak var labelsScreenController: LabelsScreenController?
    
    func labelsScreenControllerBack(_ labelsScreenController: LabelsScreenController) {
        mainNavigationController?.popViewController(animated: true)
    }
    
    // MARK: Interactive Labels Screen
    
    private weak var interactiveLabelScreenController: InteractiveLabelsScreenController?
    
    func interactiveLabelScreenControllerBack(_ interactiveLabelScreenController: InteractiveLabelsScreenController) {
        mainNavigationController?.popViewController(animated: true)
    }
    
    // MARK: Signup Screen
    
    private weak var signupScreenController: SignupScreenController?
    
    func signupScreenControllerBack(_ signupScreenController: SignupScreenController) {
        mainNavigationController?.popViewController(animated: true)
    }
    
    // MARK: Text Field Text Input View Screen
    
    private weak var textFieldTextInputViewScreenController: TextFieldTextInputViewScreenController?
    
    func textFieldTextInputViewScreenControllerBack(_ textFieldTextInputViewScreenController: TextFieldTextInputViewScreenController) {
        mainNavigationController?.popViewController(animated: true)
    }
    
    // MARK: Keyboard
    
    @objc private func keyboardWillChangeFrame(notification: NSNotification) {
        let height = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.origin.y
        guard let view = window.rootViewController?.view else { return }
        view.frame.size.height = height
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }
    
}
