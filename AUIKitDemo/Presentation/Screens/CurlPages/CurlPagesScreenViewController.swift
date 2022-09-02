//
//  CurlPagesScreenViewController.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 27.12.2021.
//

import AUIKit

protocol CurlPagesScreenViewControllerDelegate: AnyObject {
    func curlPagesScreenViewControllerBack(_ curlPagesScreenViewController: CurlPagesScreenViewController)
}

class CurlPagesScreenViewController: UIViewController {
    
    // MARK: Delegate
    
    weak var delegate: CurlPagesScreenViewControllerDelegate?
    
    // MARK: View
    
    override func loadView() {
        view = CurlPagesScreenView()
    }
    
    private var curlPagesScreenView: CurlPagesScreenView! {
        return view as? CurlPagesScreenView
    }
    
    // MARK: Childs
    
    private var pagesViewController = AUIEmptyCurlPagesController()
    
    // MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        curlPagesScreenView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        setupPagesViewController()
        setContent()
    }
    
    private func setupPagesViewController() {
        pagesViewController.portraitSpineLocation = .max
        pagesViewController.landscapeLeftSpineLocation = .mid
        pagesViewController.landscapeRightSpineLocation = .mid
        pagesViewController.view = curlPagesScreenView.pagesView
        let pageViewController1 = AUIClosuresPageController()
        pageViewController1.viewControllerClosure = {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .green
            return viewController
        }
        pageViewController1.didDisplay = {
            print("pageViewController1")
        }
        let pageViewController2 = AUIClosuresPageController()
        pageViewController2.viewControllerClosure = {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .red
            return viewController
        }
        pageViewController2.didDisplay = {
            print("pageViewController2")
        }
        let pageViewController3 = AUIClosuresPageController()
        pageViewController3.viewControllerClosure = {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .blue
            return viewController
        }
        pageViewController3.didDisplay = {
            print("pageViewController3")
        }
        let pageViewController4 = AUIClosuresPageController()
        pageViewController4.viewControllerClosure = {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .yellow
            return viewController
        }
        pageViewController4.didDisplay = {
            print("pageViewController4")
        }
        pagesViewController.pageControllers = [pageViewController1, pageViewController2, pageViewController3, pageViewController4]
    }
    
    // MARK: Actions
    
    @objc private func back() {
        delegate?.curlPagesScreenViewControllerBack(self)
    }
    
    // MARK: Content
    
    private func setContent() {
        curlPagesScreenView.titleLabel.text = "Curl Pages"
    }
    
}
