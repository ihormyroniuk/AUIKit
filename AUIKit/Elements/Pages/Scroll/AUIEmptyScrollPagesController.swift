//
//  AUIEmptyScrollPageViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 26.12.2021.
//

import UIKit

open class AUIEmptyScrollPagesController: AUIEmptyViewController, AUIScrollPagesController {
    
    // MARK: Settings
  
    public var navigationOrientation: UIPageViewController.NavigationOrientation = .horizontal {
        didSet {
            didSetNavigationOrientation(oldValue)
        }
    }
    open func didSetNavigationOrientation(_ oldValue: UIPageViewController.NavigationOrientation) {
        resetupPagesViewController()
    }
    
    public var interPageSpacing: CGFloat? {
        didSet {
            didSetInterPageSpacing(oldValue)
        }
    }
    open func didSetInterPageSpacing(_ oldValue: CGFloat?) {
        resetupPagesViewController()
    }
    
    open var isLooping: Bool? {
        didSet {
            didSetIsLooping(oldValue)
        }
    }
    open func didSetIsLooping(_ oldValue: Bool?) {
        guard let selectedPageController = selectedPageController else { return }
        selectPageController(selectedPageController)
    }
    
    // MARK: Pages
  
    open var pageControllers: [AUIPageController]? = [] {
        didSet {
            didSetPageControllers(oldValue)
        }
    }
    open func didSetPageControllers(_ oldValue: [AUIPageController]?) {
        guard let firstPageController = pageControllers?.first else { return }
        selectPageController(firstPageController)
    }
    
    open func selectPageController(_ pageController: AUIPageController) {
        let containerPageViewController = PageViewController(pageController: pageController)
        pagesViewController?.setViewControllers([containerPageViewController], direction: .forward, animated: false)
    }
  
    open func selectPageControllerAnimated(_ pageController: AUIPageController, navigationDirection: UIPageViewController.NavigationDirection, completion: ((Bool) -> Void)?) {
        let containerPageViewController = PageViewController(pageController: pageController)
        pagesViewController?.setViewControllers([containerPageViewController], direction: navigationDirection, animated: true, completion: { [weak self] finished in
            guard let self = self else { return }
            self.selectedPageController?.didSelect()
            completion?(finished)
        })
    }
  
    open var selectedPageController: AUIPageController? {
        let pageViewController = pagesViewController?.viewControllers?.first as? PageViewController
        return pageViewController?.pageController
    }
  
    // MARK: Components
    
    private let pageViewControllerDataSourceDelegate = AUIPageViewControllerDataSourceDelegateProxy()
    private var pagesViewController: AUISelfLayoutPageViewController?
  
    // MARK: Setup
  
    open override func setup() {
        super.setup()
        pageViewControllerDataSourceDelegate.delegate = self
    }
  
    open override func setupView() {
        super.setupView()
        guard let view = view else { return }
        let options: [UIPageViewController.OptionsKey : Any]?
        if let interPageSpacing = interPageSpacing {
            options = [UIPageViewController.OptionsKey.interPageSpacing : NSNumber(value: interPageSpacing)]
        } else {
            options = nil
        }
        let pagesViewController = AUISelfLayoutPageViewController(containerView: view, transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: options)
        pagesViewController.dataSource = pageViewControllerDataSourceDelegate
        pagesViewController.delegate = pageViewControllerDataSourceDelegate
        self.pagesViewController = pagesViewController
    }
  
    open override func unsetupView() {
        super.unsetupView()
        pagesViewController?.view.removeFromSuperview()
        pagesViewController = nil
    }
    
    private func resetupPagesViewController() {
        guard let view = view else { return }
        let selectedPageController = self.selectedPageController
        pagesViewController?.view.removeFromSuperview()
        pagesViewController = nil
        let options: [UIPageViewController.OptionsKey : Any]?
        if let interPageSpacing = interPageSpacing {
            options = [.interPageSpacing : NSNumber(value: interPageSpacing)]
        } else {
            options = nil
        }
        let pagesViewController = AUISelfLayoutPageViewController(containerView: view, transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: options)
        pagesViewController.dataSource = pageViewControllerDataSourceDelegate
        pagesViewController.delegate = pageViewControllerDataSourceDelegate
        self.pagesViewController = pagesViewController
        if let selectedPageController = selectedPageController {
            selectPageController(selectedPageController)
        }
    }
  
    // MARK: Events

    open func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let pageControllers = pageControllers else { return nil }
        guard let pageViewController = viewController as? PageViewController else { return nil }
        let pageController = pageViewController.pageController
        guard let index = pageControllers.firstIndex(where: { $0 === pageController }) else { return nil }
        if index > 0 {
            let beforeIndex = index - 1
            let beforePageController = pageControllers[beforeIndex]
            let pageViewController = PageViewController(pageController: beforePageController)
            return pageViewController
        } else if isLooping == true {
            let beforeIndex = pageControllers.count - 1
            let beforePageController = pageControllers[beforeIndex]
            let pageViewController = PageViewController(pageController: beforePageController)
            return pageViewController
        } else {
            return nil
        }
  }
  
    open func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let pageControllers = pageControllers else { return nil }
        guard let pageViewController = viewController as? PageViewController else { return nil }
        let pageController = pageViewController.pageController
        guard let index = pageControllers.firstIndex(where: { $0 === pageController }) else { return nil }
        if index < (pageControllers.count - 1) {
            let afterIndex = index + 1
            let afterPageController = pageControllers[afterIndex]
            let pageViewController = PageViewController(pageController: afterPageController)
            return pageViewController
        } else if isLooping == true {
            let beforeIndex = 0
            let beforePageController = pageControllers[beforeIndex]
            let pageViewController = PageViewController(pageController: beforePageController)
            return pageViewController
        } else {
            return nil
        }
    }
  
    open func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        selectedPageController?.didSelect()
    }
  
}

private class AUIPageViewControllerDataSourceDelegateProxy: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
  
    weak var delegate: AUIEmptyScrollPagesController?
  
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return delegate?.pageViewController(pageViewController, viewControllerBefore: viewController)
    }
  
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return delegate?.pageViewController(pageViewController, viewControllerAfter: viewController)
    }
  
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        delegate?.pageViewController(pageViewController, didFinishAnimating: finished, previousViewControllers: previousViewControllers, transitionCompleted: completed)
    }
    
}

private class AUISelfLayoutPageViewController: UIPageViewController {
  
    // MARK: Elements
  
    let containerView: UIView
  
    // MARK: Initializer
  
    init(containerView: UIView, transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        self.containerView = containerView
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
        containerView.addSubview(view)
        view.frame = containerView.bounds
    }
  
    required init?(coder: NSCoder) { return nil }
  
    // MARK: Layout
  
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.frame = view.superview?.bounds ?? .zero
    }
  
}

private class PageViewController: UIViewController {
  
    let pageController: AUIPageController
    private let viewController: UIViewController
  
    init(pageController: AUIPageController) {
        self.pageController = pageController
        self.viewController = pageController.viewController
        super.init(nibName: nil, bundle: nil)
        view.addSubview(viewController.view)
        addChild(viewController)
        viewController.didMove(toParent: self)
    }
  
    convenience required init?(coder aDecoder: NSCoder) { return nil }
  
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        viewController.view.frame = view?.bounds ?? .zero
    }
}
