//
//  IntroScreenController.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 01.04.2021.
//

import AUIKit

protocol IntroScreenViewControllerDelegate: AnyObject {
    func introScreenViewControllerBack(_ introScreenViewController: IntroScreenViewController)
}

class IntroScreenViewController: UIViewController, AUIPagesViewControllerDidTransitToPageObserver {
    
    // MARK: Delegate
    
    weak var delegate: IntroScreenViewControllerDelegate?
    
    // MARK: View
    
    override func loadView() {
        view = IntroScreenView()
    }
    
    private var introScreenView: IntroScreenView! {
        return view as? IntroScreenView
    }
    
    // MARK: Childs
    
    private var pagesViewController = AUIEmptyScrollPagesController()
    
    // MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introScreenView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        setupPagesViewController()
    }
    
    private func setupPagesViewController() {
        pagesViewController.navigationOrientation = .horizontal
        pagesViewController.isInfiniteScroll = true
        let pageViewController1 = AUIClosuresPageController()
        pageViewController1.viewControllerClosure = {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .green
            return viewController
        }
        let pageViewController2 = AUIClosuresPageController()
        pageViewController2.viewControllerClosure = {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .red
            return viewController
        }
        let pageViewController3 = AUIClosuresPageController()
        pageViewController3.viewControllerClosure = {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .blue
            return viewController
        }
        let pageViewController4 = AUIClosuresPageController()
        pageViewController4.viewControllerClosure = {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .yellow
            return viewController
        }
        pagesViewController.pageControllers = [pageViewController1, pageViewController2, pageViewController3, pageViewController4]
        pagesViewController.view = introScreenView.pagesView
        pagesViewController.selectPageController(pageViewController1)
    }
    
    // MARK: Actions
    
    @objc private func back() {
        delegate?.introScreenViewControllerBack(self)
    }
    
    // MARK: AUIPagesViewControllerDidTransitToPageObserver
    
    func pagesViewController(_ pagesViewController: AUIPagesViewController, didTransitToPageViewControllers pageViewControllers: [AUIPageController]) {
        print(pageViewControllers)
    }
    
}

