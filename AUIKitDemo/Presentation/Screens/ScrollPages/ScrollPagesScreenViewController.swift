//
//  IntroScreenController.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 01.04.2021.
//

import AUIKit

protocol ScrollPagesScreenViewControllerDelegate: AnyObject {
    func scrollPagesScreenViewControllerBack(_ scrollPagesScreenController: ScrollPagesScreenViewController)
}

class ScrollPagesScreenViewController: UIViewController {
    
    // MARK: Delegate
    
    weak var delegate: ScrollPagesScreenViewControllerDelegate?
    
    // MARK: View
    
    override func loadView() {
        view = ScrollPagesScreenView()
    }
    
    private var scrollPagesScreenView: ScrollPagesScreenView! {
        return view as? ScrollPagesScreenView
    }
    
    // MARK: Childs
    
    private var pagesViewController = AUIEmptyScrollPagesController()
    
    // MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollPagesScreenView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        setupPagesViewController()
        setContent()
    }
    
    private func setupPagesViewController() {
        pagesViewController.navigationOrientation = .horizontal
        pagesViewController.isLooping = true
        pagesViewController.interPageSpacing = 20
        pagesViewController.view = scrollPagesScreenView.pagesView
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
        pagesViewController.selectPageController(pageViewController1)
    }
    
    // MARK: Actions
    
    @objc private func back() {
        delegate?.scrollPagesScreenViewControllerBack(self)
    }
    
    // MARK: Content
    
    private func setContent() {
        scrollPagesScreenView.titleLabel.text = "Scroll Pages"
    }
    
}
