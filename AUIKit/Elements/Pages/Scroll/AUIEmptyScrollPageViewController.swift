//
//  AUIEmptyScrollPageViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 26.12.2021.
//

import UIKit

open class AUIEmptyScrollPageViewController: AUIEmptyViewController, AUIScrollPageViewController {
  
    private let pageViewControllerDataSourceDelegate = AUIPageViewControllerDataSourceDelegateProxy()
    
    // MARK: Select
  
    open func selectPageController(_ pageController: AUIPageViewController) {
        
    }
  
    open func selectedPageController() -> AUIPageViewController? {
        return nil
    }
  
    // MARK: Controllers
  
    private var pagesViewController: AUISelfLayoutPageViewController?
    open var pageControllers: [AUIPageViewController] = []
  
    // MARK: Initializer
  
    public init(navigationOrientation: UIPageViewController.NavigationOrientation = .horizontal,
                options: [UIPageViewController.OptionsKey : Any] = [:]) {
        self.navigationOrientation = navigationOrientation
        self.options = options
    }
  
    // MARK: State
  
    private var navigationOrientation: UIPageViewController.NavigationOrientation
    private var options: [UIPageViewController.OptionsKey : Any]
  
    open var pagesCount: Int { return pageControllers.count }
    open var currentPageNumber: Int? {
        guard let containerPageViewController = pagesViewController?.viewControllers?.first as? NumberedContainerViewController else { return nil }
        let currentPageNumber: Int = containerPageViewController.number
        return currentPageNumber
    }
    open var currentPageControllers: AUIPageViewController? {
        guard let currentPageNumber = self.currentPageNumber else { return nil }
        return pageControllers[currentPageNumber]
    }
  
    // MARK: Setup
  
    open override func setup() {
        super.setup()
        pageViewControllerDataSourceDelegate.delegate = self
        setupPageViewController()
    }
  
    open func setupPageViewController() {
        pagesViewController?.dataSource = pageViewControllerDataSourceDelegate
        pagesViewController?.delegate = pageViewControllerDataSourceDelegate
    }
  
    open override func setupView() {
        super.setupView()
        guard let view = view else { return }
        let pagesViewController = AUISelfLayoutPageViewController(containerView: view, transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: options)
        self.pagesViewController = pagesViewController
        setupPageViewController()
        reload()
    }
  
    open override func unsetupView() {
        super.unsetupView()
        pagesViewController?.view.removeFromSuperview()
        pagesViewController = nil
    }
  
    // MARK: Reload
  
    open func reload() {
        if pagesViewController?.spineLocation == .mid {
            guard let pageViewController = pageControllers.first else { return }
            let containerPageViewController = NumberedContainerViewController(number: 0, viewController: pageViewController.viewController)
            let containerPageViewController2 = NumberedContainerViewController(number: 1, viewController: pageControllers[1].viewController)
            pagesViewController?.setViewControllers([containerPageViewController, containerPageViewController2], direction: .forward, animated: false, completion: nil)
//        for object in didTransitToPageObservers.allObjects {
//          guard let observer = object as? AUIPagesViewControllerDidTransitToPageObserver else { continue }
//          observer.pagesViewController(self, didTransitToPageViewControllers: currentPageControllers)
//        }
        } else {
            guard let pageViewController = pageControllers.first else { return }
            let containerPageViewController = NumberedContainerViewController(number: 0, viewController: pageViewController.viewController)
            pagesViewController?.setViewControllers([containerPageViewController], direction: .forward, animated: false, completion: nil)
//      for object in didTransitToPageObservers.allObjects {
//        guard let observer = object as? AUIPagesViewControllerDidTransitToPageObserver else { continue }
//        observer.pagesViewController(self, didTransitToPageViewControllers: currentPageControllers)
//      }
    }
    
  }
  
    // MARK: Events

    open func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let numberedContainerViewController = viewController as? NumberedContainerViewController else { return nil }
        let number = numberedContainerViewController.number
        guard number > 0 else { return nil }
        let beforeNumber = number - 1
        let beforePageController = pageControllers[beforeNumber]
        let beforeNumberedContainerViewController = NumberedContainerViewController(number: beforeNumber, viewController: beforePageController.viewController)
        return beforeNumberedContainerViewController
  }
  
    open func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let numberedContainerViewController = viewController as? NumberedContainerViewController else { return nil }
        let number = numberedContainerViewController.number
        guard number < (pageControllers.count - 1) else { return nil }
        let afterNumber = number + 1
        let afterPageController = pageControllers[afterNumber]
        let afterNumberedContainerViewController = NumberedContainerViewController(number: afterNumber, viewController: afterPageController.viewController)
        return afterNumberedContainerViewController
    }
  
    open func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//    for object in didTransitToPageObservers.allObjects {
//      guard let observer = object as? AUIPagesViewControllerDidTransitToPageObserver else { continue }
//      observer.pagesViewController(self, didTransitToPageViewControllers: currentPageControllers)
//    }
    }
  
}

private class AUIPageViewControllerDataSourceDelegateProxy: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
  
    weak var delegate: AUIEmptyScrollPageViewController?
  
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
    }
  
    required init?(coder: NSCoder) { return nil }
  
    // MARK: Layout
  
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.frame = view.superview?.bounds ?? .zero
    }
  
}

private class NumberedContainerViewController: UIViewController {
  
    let number: Int
    private let viewController: UIViewController
  
    init(number: Int, viewController: UIViewController) {
        self.number = number
        self.viewController = viewController
        super.init(nibName: nil, bundle: nil)
        //viewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewController.view)
        addChild(viewController)
        viewController.didMove(toParent: viewController)
    }
  
    @available(*, unavailable)
    convenience required init?(coder aDecoder: NSCoder) { return nil }
  
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        viewController.view.frame = view?.bounds ?? .zero
    }
}
