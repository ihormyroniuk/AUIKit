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
    }
    
    private func setupPagesViewController() {
        pagesViewController.orientationSpineLocation = AUICurlPagesControllerOrientationSpineLocation(portrait: .min, portraitUpsideDown: .max, landscapeLeft: .mid, landscapeRight: .mid, unknown: .min)
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
        pagesViewController.view = curlPagesScreenView.pagesView
        pagesViewController.selectPageController(pageViewController1)
    }
    
    // MARK: Actions
    
    @objc private func back() {
        delegate?.curlPagesScreenViewControllerBack(self)
    }
    
}
