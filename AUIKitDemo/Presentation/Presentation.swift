//
//  Presentation.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 21.07.2020.
//

import AUIKit

class Presentation: AUIWindowPresentation, MenuScreenViewControllerDelegate, ScrollPagesScreenViewControllerDelegate, CurlPagesScreenViewControllerDelegate, InteractiveLabelsScreenViewControllerDelegate, LabelsScreenControllerDelegate, SignupScreenControllerDelegate, TextFieldTextInputViewScreenControllerDelegate, TableViewScreenViewControllerDelegate, CollectionViewScreenViewControllerDelegate {
    
    // MARK: Display
    
    func startDisplay() {
        let screenController = MenuScreenViewController()
        screenController.delegate = self
        menuScreenController = screenController
        let navigationController = AUINavigationBarHiddenNavigationController()
        navigationController.viewControllers = [screenController]
        mainNavigationController = navigationController
        window.rootViewController = mainNavigationController
        window.makeKeyAndVisible()
    }
    
    // MARK: Main Navigation Controller
    
    private weak var mainNavigationController: AUINavigationController?
    
    // MARK: Menu Screen Controller
    
    private weak var menuScreenController: MenuScreenViewController?
    
    func menuScreenViewControllerDisplayScrollPagesScreen(_ menuScreenController: MenuScreenViewController) {
        let screenController = ScrollPagesScreenViewController()
        screenController.delegate = self
        scrollPagesScreenController = screenController
        mainNavigationController?.pushViewController(screenController, animated: true)
    }
    
    func menuScreenViewControllerDisplayCurlPagesScreen(_ menuScreenViewController: MenuScreenViewController) {
        let screenController = CurlPagesScreenViewController()
        screenController.delegate = self
        curlPagesScreenController = screenController
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
    
    private lazy var transitioning: UIViewControllerTransitioningDelegate = {
        //return TopAlertViewControllerTransitioningDelegate(window: window)
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
    
    func menuScreenViewControllerDisplayTableView(_ menuScreenViewController: MenuScreenViewController) {
        let viewController = TableViewScreenViewController()
        tableViewScreenViewController = viewController
        tableViewScreenViewController?.delegate = self
        mainNavigationController?.pushViewController(viewController, animated: true)
    }
    
    func menuScreenViewControllerDisplayCollectionView(_ menuScreenViewController: MenuScreenViewController) {
        let viewController = CollectionViewScreenViewController()
        collectionViewScreenViewController = viewController
        collectionViewScreenViewController?.delegate = self
        mainNavigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: Scroll Pages Screen
    
    private weak var scrollPagesScreenController: ScrollPagesScreenViewController?
    
    func scrollPagesScreenViewControllerBack(_ scrollPagesScreenController: ScrollPagesScreenViewController) {
        mainNavigationController?.popViewController(animated: true)
    }
    
    // MARK: Curl Pages Screen
    
    private weak var curlPagesScreenController: CurlPagesScreenViewController?
    
    func curlPagesScreenViewControllerBack(_ curlPagesScreenController: CurlPagesScreenViewController) {
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
    
    // TableView Screen
    
    private weak var tableViewScreenViewController: TableViewScreenViewController?
    
    func tableViewScreenViewControllerBack(_ testTableViewScreenViewController: TableViewScreenViewController) {
        mainNavigationController?.popViewController(animated: true)
    }
    
    // CollectionView Screen
    
    private weak var collectionViewScreenViewController: CollectionViewScreenViewController?
    
    func collectionViewScreenViewControllerBack(_ testTableViewScreenViewController: CollectionViewScreenViewController) {
        mainNavigationController?.popViewController(animated: true)
    }
    
}
