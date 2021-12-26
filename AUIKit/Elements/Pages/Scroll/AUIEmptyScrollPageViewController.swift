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
        guard let index = pageControllers.firstIndex(where: { $0 === pageController }) else { return }
        let containerPageViewController = NumberedContainerViewController(number: index, viewController: pageController.viewController)
        pagesViewController?.setViewControllers([containerPageViewController], direction: .forward, animated: false)
    }
  
    open func selectPageControllerAnimated(_ pageController: AUIPageViewController, navigationDirection: UIPageViewController.NavigationDirection, completion: ((Bool) -> Void)?) {
        guard let index = pageControllers.firstIndex(where: { $0 === pageController }) else { return }
        let containerPageViewController = NumberedContainerViewController(number: index, viewController: pageController.viewController)
        pagesViewController?.setViewControllers([containerPageViewController], direction: navigationDirection, animated: true, completion: { finished in
            completion?(finished)
        })
    }
  
    open var selectedPageController: AUIPageViewController? {
        return currentPageController
    }
  
    // MARK: Controllers
  
    private var pagesViewController: AUISelfLayoutPageViewController?
    open var pageControllers: [AUIPageViewController] = []
  
    // MARK: State
  
    public var navigationOrientation: UIPageViewController.NavigationOrientation = .horizontal {
        didSet {
            didSetNavigationOrientation(oldValue)
        }
    }
    open func didSetNavigationOrientation(_ oldValue: UIPageViewController.NavigationOrientation) {
        guard let selectedPageController = selectedPageController else { return }
        selectPageController(selectedPageController)
    }
    
    public var interPageSpacing: CGFloat? {
        didSet {
            didSetInterPageSpacing(oldValue)
        }
    }
    open func didSetInterPageSpacing(_ oldValue: CGFloat?) {
        guard let selectedPageController = selectedPageController else { return }
        selectPageController(selectedPageController)
    }
    
    open var isInfiniteScroll: Bool? {
        didSet {
            didSetIsInfiniteScroll(oldValue)
        }
    }
    open func didSetIsInfiniteScroll(_ oldValue: Bool?) {
        guard let selectedPageController = selectedPageController else { return }
        selectPageController(selectedPageController)
    }
  
    open var pagesCount: Int { return pageControllers.count }
    open var currentPageNumber: Int? {
        guard let containerPageViewController = pagesViewController?.viewControllers?.first as? NumberedContainerViewController else { return nil }
        let currentPageNumber: Int = containerPageViewController.number
        return currentPageNumber
    }
    open var currentPageController: AUIPageViewController? {
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
        let pagesViewController = AUISelfLayoutPageViewController(containerView: view, transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: [UIPageViewController.OptionsKey.interPageSpacing : NSNumber(value: interPageSpacing ?? 0)])
        self.pagesViewController = pagesViewController
        setupPageViewController()
    }
  
    open override func unsetupView() {
        super.unsetupView()
        pagesViewController?.view.removeFromSuperview()
        pagesViewController = nil
    }
  
    // MARK: Events

    open func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let numberedContainerViewController = viewController as? NumberedContainerViewController else { return nil }
        let number = numberedContainerViewController.number
        if number > 0 {
            let beforeNumber = number - 1
            let beforePageController = pageControllers[beforeNumber]
            let beforeNumberedContainerViewController = NumberedContainerViewController(number: beforeNumber, viewController: beforePageController.viewController)
            return beforeNumberedContainerViewController
        } else {
            guard isInfiniteScroll ?? false, pageControllers.count > 1 else { return nil }
            let beforeNumber = pageControllers.count - 1
            let beforePageController = pageControllers[beforeNumber]
            let beforeNumberedContainerViewController = NumberedContainerViewController(number: beforeNumber, viewController: beforePageController.viewController)
            return beforeNumberedContainerViewController
        }
  }
  
    open func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let numberedContainerViewController = viewController as? NumberedContainerViewController else { return nil }
        let number = numberedContainerViewController.number
        if number < (pageControllers.count - 1) {
            let afterNumber = number + 1
            let afterPageController = pageControllers[afterNumber]
            let afterNumberedContainerViewController = NumberedContainerViewController(number: afterNumber, viewController: afterPageController.viewController)
            return afterNumberedContainerViewController
        } else {
            guard isInfiniteScroll ?? false, pageControllers.count > 1 else { return nil }
            let beforeNumber = 0
            let beforePageController = pageControllers[beforeNumber]
            let beforeNumberedContainerViewController = NumberedContainerViewController(number: beforeNumber, viewController: beforePageController.viewController)
            return beforeNumberedContainerViewController
        }
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
