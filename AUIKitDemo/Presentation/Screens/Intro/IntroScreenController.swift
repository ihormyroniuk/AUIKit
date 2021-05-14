//
//  IntroScreenController.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 01.04.2021.
//

import UIKit
import AUIKit

protocol IntroScreenControllerDelegate: AnyObject {
    func introScreenControllerBack(_ introScreenController: IntroScreenController)
}

class IntroScreenController: AUIEmptyScreenController, AUIPagesViewControllerDidTransitToPageObserver {
    
    // MARK: Delegate
    
    weak var delegate: IntroScreenControllerDelegate?
    
    // MARK: View
    
    private var introScreenView: IntroScreenView! {
        return view as? IntroScreenView
    }
    
    // MARK: Childs
    
    private let pagesViewController = AUIDefaultPagesController()
    
    // MARK: Setup
    
    override func setup() {
        super.setup()
        introScreenView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        setupPagesViewController()
    }
    
    private func setupPagesViewController() {
        pagesViewController.view = introScreenView.pagesView
        pagesViewController.addDidTransitToPageObserver(self)
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
        pagesViewController.reload()
    }
    
    // MARK: Actions
    
    @objc private func back() {
        delegate?.introScreenControllerBack(self)
    }
    
    // MARK: AUIPagesViewControllerDidTransitToPageObserver
    
    func pagesViewController(_ pagesViewController: AUIPagesViewController, didTransitToPageViewControllers pageViewControllers: [AUIPageViewController]) {
        print(pageViewControllers)
    }
    
}

