//
//  Presentation.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 21.07.2020.
//

import AUIKit

class Presentation: AUIWindowPresentation, MenuScreenViewControllerDelegate, IntroScreenViewControllerDelegate, InteractiveLabelsScreenViewControllerDelegate, LabelsScreenControllerDelegate, SignupScreenControllerDelegate, TextFieldTextInputViewScreenControllerDelegate, StringsdictScreenViewControllerDelegate {
    
    // MARK: Display
    
    func display() {
        let screenController = MenuScreenViewController()
        screenController.delegate = self
        menuScreenController = screenController
            
        let navigationController = AUINavigationController()
        navigationController.viewControllers = [screenController]
        mainNavigationController = navigationController
        
        window.rootViewController = mainNavigationController
        window.makeKeyAndVisible()
    }
    
    // MARK: Main Navigation Controller
    
    private weak var mainNavigationController: AUINavigationController?
    
    // MARK: Menu Screen Controller
    
    private weak var menuScreenController: MenuScreenViewController?
    
    func menuScreenViewControllerDisplayIntroScreen(_ menuScreenController: MenuScreenViewController) {
        let screenController = IntroScreenViewController()
        screenController.delegate = self
        introScreenController = screenController
        mainNavigationController?.pushViewController(screenController, animated: true)
    }
    
    func menuScreenViewControllerDisplayLabelsScreen(_ menuScreenController: MenuScreenViewController) {
        let screenController = LabelsScreenController()
        screenController.delegate = self
        labelsScreenController = screenController
        mainNavigationController?.pushViewController(screenController, animated: true)
    }
    
    func menuScreenViewControllerDisplayInteractiveLabelsScreen(_ menuScreenController: MenuScreenViewController) {
        let screenController = InteractiveLabelsScreenViewController()
        screenController.delegate = self
        interactiveLabelScreenController = screenController
        mainNavigationController?.pushViewController(screenController, animated: true)
    }
    
    func menuScreenViewControllerDisplaySignupScreen(_ menuScreenController: MenuScreenViewController) {
        let screenController = SignupScreenController()
        screenController.delegate = self
        signupScreenController = screenController
        mainNavigationController?.pushViewController(screenController, animated: true)
    }
    
    func menuScreenViewControllerDisplayTextFieldTextInputViewScreen(_ menuScreenController: MenuScreenViewController) {
        let screenController = TextFieldTextInputViewScreenController()
        screenController.delegate = self
        textFieldTextInputViewScreenController = screenController
        mainNavigationController?.pushViewController(screenController, animated: true)
    }
    
    private lazy var transitioning: PresentAnimationTransitioningDelegate = {
        return PresentAnimationTransitioningDelegate(window: window)
    }()
    func menuScreenViewControllerDisplayPresentAnimations(_ menuScreenController: MenuScreenViewController) {
        let screenController = PresentAnimationScreenViewController()
        screenController.transitioningDelegate = transitioning
        screenController.modalPresentationStyle = .overCurrentContext
        mainNavigationController?.present(screenController, animated: true, completion: nil)
    }
    
    func menuScreenViewControllerDisplayPushAnimations(_ menuScreenController: MenuScreenViewController) {
        let vc = UIViewController()
        vc.view.backgroundColor = .green
        mainNavigationController?.addCustomTransitioning()
        mainNavigationController?.pushViewController(vc, animated: true)
    }
    
    func menuScreenViewControllerDisplayStringsdict(_ menuScreenController: MenuScreenViewController) {
        let screenView = StringsdictScreenView()
        let screenController = StringsdictScreenViewController(view: screenView)
        screenController.delegate = self
        stringsdictScreenViewController = screenController
        mainNavigationController?.pushViewController(screenController, animated: true)
    }
    
    // MARK: Intro Screen
    
    private weak var introScreenController: IntroScreenViewController?
    
    func introScreenViewControllerBack(_ introScreenController: IntroScreenViewController) {
        mainNavigationController?.popViewController(animated: true)
    }
    
    // MARK: Labels Screen
    
    private weak var labelsScreenController: LabelsScreenController?
    
    func labelsScreenControllerBack(_ labelsScreenController: LabelsScreenController) {
        mainNavigationController?.popViewController(animated: true)
    }
    
    // MARK: Interactive Labels Screen
    
    private weak var interactiveLabelScreenController: InteractiveLabelsScreenViewController?
    
    func interactiveLabelScreenViewControllerBack(_ interactiveLabelScreenController: InteractiveLabelsScreenViewController) {
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
    
    // MARK: Stringsdict Screen
    
    private weak var stringsdictScreenViewController: StringsdictScreenViewController?
    
    func stringsdictScreenViewControllerBack(_ stringsdictScreenViewController: StringsdictScreenViewController) {
        mainNavigationController?.popViewController(animated: true)
    }
    
}
