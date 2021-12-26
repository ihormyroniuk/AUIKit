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
    
    private var pagesViewController: AUIEmptyScrollPageViewController = {
        let pagesViewController = AUIEmptyScrollPageViewController(
            navigationOrientation: .horizontal,
            interPageSpacing: 200)
        return pagesViewController
    }()
    
    // MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introScreenView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        setupPagesViewController()
    }
    
    private func setupPagesViewController() {
        let pageViewController1 = AUIDefaultPageController(viewController: AUIEmptyViewController()) { () -> UIView in
            let view = UIView()
            view.backgroundColor = .green
            return view
        }
        let pageViewController2 = AUIDefaultPageController(viewController: AUIEmptyViewController()) { () -> UIView in
            let view = UIView()
            view.backgroundColor = .red
            return view
        }
        let pageViewController3 = AUIDefaultPageController(viewController: AUIEmptyViewController()) { () -> UIView in
            let view = UIView()
            view.backgroundColor = .blue
            return view
        }
        let pageViewController4 = AUIDefaultPageController(viewController: AUIEmptyViewController()) { () -> UIView in
            let view = UIView()
            view.backgroundColor = .yellow
            return view
        }
        pagesViewController.pageControllers = [pageViewController1, pageViewController2, pageViewController3, pageViewController4]
        pagesViewController.view = introScreenView.pagesView
        //pagesViewController.addDidTransitToPageObserver(self)
        pagesViewController.reload()
    }
    
    // MARK: Actions
    
    @objc private func back() {
        delegate?.introScreenViewControllerBack(self)
    }
    
    // MARK: AUIPagesViewControllerDidTransitToPageObserver
    
    func pagesViewController(_ pagesViewController: AUIPagesViewController, didTransitToPageViewControllers pageViewControllers: [AUIPageViewController]) {
        print(pageViewControllers)
    }
    
}

