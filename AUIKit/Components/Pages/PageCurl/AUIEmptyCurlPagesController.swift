//
//  AUIEmptyCurlPagesController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 27.12.2021.
//

import UIKit

open class AUIEmptyCurlPagesController: AUIEmptyViewController, AUICurlPagesController {
    
    // MARK: Settings
    
    open var portraitSpineLocation: UIPageViewController.SpineLocation?
    open var portraitUpsideDownSpineLocation: UIPageViewController.SpineLocation?
    open var landscapeLeftSpineLocation: UIPageViewController.SpineLocation?
    open var landscapeRightSpineLocation: UIPageViewController.SpineLocation?
    open var unknownSpineLocation: UIPageViewController.SpineLocation?
    private static let defaultSpineLocation: UIPageViewController.SpineLocation = .min
    open var spineLocation: UIPageViewController.SpineLocation = defaultSpineLocation
    
    // MARK: Pages
    
    open var pageControllers: [AUIPageController]? {
        didSet {
            didSetPageControllers(oldValue)
        }
    }
    open func didSetPageControllers(_ oldValue: [AUIPageController]?) {
        guard let firstPageController = pageControllers?.first else { return }
        displayPageController(firstPageController)
    }
    
    open var displayedPageController: AUIPageController? {
        let pageViewController = pagesViewController?.viewControllers?.first as? PageViewController
        return pageViewController?.pageController
    }
    
    open func displayPageController(_ pageController: AUIPageController) {
        guard let pageControllers = pageControllers else { return }
        guard pageControllers.contains(where: { $0 === pageController }) else { return }
        if spineLocation == .mid {
            guard let index = pageControllers.firstIndex(where: { $0 === pageController }) else { return }
            if index % 2 == 0 {
                let leftContainerPageViewController = PageViewController(pageController: pageController)
                let rightContainerPageViewController = PageViewController(pageController: pageControllers[index + 1])
                pagesViewController?.setViewControllers([leftContainerPageViewController, rightContainerPageViewController], direction: .forward, animated: false)
            } else {
                let rightContainerPageViewController = PageViewController(pageController: pageController)
                let leftContainerPageViewController = PageViewController(pageController: pageControllers[index - 1])
                pagesViewController?.setViewControllers([leftContainerPageViewController, rightContainerPageViewController], direction: .forward, animated: false)
            }
        } else {
            let pageViewController = PageViewController(pageController: pageController)
            pagesViewController?.setViewControllers([pageViewController], direction: .forward, animated: false)
        }
    }
  
    open func displayPageControllerAnimated(_ pageController: AUIPageController, navigationDirection: UIPageViewController.NavigationDirection, completion: ((Bool) -> Void)?) {
        guard let pageControllers = pageControllers else { return }
        guard pageControllers.contains(where: { $0 === pageController }) else { return }
        if spineLocation == .mid {
            let pageViewController = PageViewController(pageController: pageController)
            pagesViewController?.setViewControllers([pageViewController], direction: navigationDirection, animated: true, completion: { [weak self] finished in
                guard let self = self else { return }
                self.displayedPageController?.didDisplay()
                completion?(finished)
            })
        } else {
            let pageViewController = PageViewController(pageController: pageController)
            pagesViewController?.setViewControllers([pageViewController], direction: navigationDirection, animated: true, completion: { [weak self] finished in
                guard let self = self else { return }
                self.displayedPageController?.didDisplay()
                completion?(finished)
            })
        }
    }
  
    // MARK: Components
    
    private let pagesViewControllerDataSourceDelegate = AUIPagesViewControllerDataSourceDelegateProxy()
    private var pagesViewController: AUISelfLayoutPageViewController?
    
    // MARK: Setup
  
    open override func setup() {
        super.setup()
        pagesViewControllerDataSourceDelegate.delegate = self
    }
    
    open override func setupView() {
        super.setupView()
        guard let view = view else { return }
        let options = [UIPageViewController.OptionsKey.spineLocation : NSNumber(value: spineLocation.rawValue)]
        let pagesViewController = AUISelfLayoutPageViewController(containerView: view, transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: options)
        pagesViewController.dataSource = pagesViewControllerDataSourceDelegate
        pagesViewController.delegate = pagesViewControllerDataSourceDelegate
        self.pagesViewController = pagesViewController
    }
  
    open override func unsetupView() {
        super.unsetupView()
        pagesViewController?.view.removeFromSuperview()
        pagesViewController = nil
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
        } else {
            return nil
        }
    }
    
    open func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        for viewController in pendingViewControllers {
            guard let pageViewController = viewController as? PageViewController else { return }
            let pageController = pageViewController.pageController
            pageController.willDisplay()
        }
    }
    
    open func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        displayedPageController?.didDisplay()
    }
    
    open func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewController.SpineLocation {
        let spineLocation: UIPageViewController.SpineLocation
        if orientation == .portrait, let portraitSpineLocation = portraitSpineLocation {
            spineLocation = portraitSpineLocation
        } else if orientation == .portraitUpsideDown, let portraitUpsideDownSpineLocation = portraitUpsideDownSpineLocation {
            spineLocation = portraitUpsideDownSpineLocation
        } else if orientation == .landscapeLeft, let landscapeLeftSpineLocation = landscapeLeftSpineLocation {
            spineLocation = landscapeLeftSpineLocation
        } else if orientation == .landscapeRight, let landscapeRightSpineLocation = landscapeRightSpineLocation {
            spineLocation = landscapeRightSpineLocation
        } else if let unknownSpineLocation = unknownSpineLocation {
            spineLocation = unknownSpineLocation
        } else {
            spineLocation = .min
        }
        self.spineLocation = spineLocation
        if spineLocation == .mid {
            pagesViewController?.isDoubleSided = true
        } else {
            pagesViewController?.isDoubleSided = false
        }
        if let selectedPageController = displayedPageController {
            displayPageController(selectedPageController)
        }
        return spineLocation
    }
  
}

private class AUIPagesViewControllerDataSourceDelegateProxy: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
  
    weak var delegate: AUIEmptyCurlPagesController?
  
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return delegate?.pageViewController(pageViewController, viewControllerBefore: viewController)
    }
  
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return delegate?.pageViewController(pageViewController, viewControllerAfter: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        delegate?.pageViewController(pageViewController, willTransitionTo: pendingViewControllers)
    }
  
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        delegate?.pageViewController(pageViewController, didFinishAnimating: finished, previousViewControllers: previousViewControllers, transitionCompleted: completed)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewController.SpineLocation {
        return delegate?.pageViewController(pageViewController, spineLocationFor: orientation) ?? .min
    }
    
}

private class AUISelfLayoutPageViewController: UIPageViewController {
  
    // MARK: Elements
  
    let containerView: UIView
  
    // MARK: Initializer
  
    init(containerView: UIView, transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        self.containerView = containerView
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
        let parentViewController = containerView.parentViewController
        parentViewController?.addChild(self)
        containerView.addSubview(view)
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

private extension UIView {
    var parentViewController: UIViewController? {
        // Starts from next (As we know self is not a UIViewController).
        var parentResponder: UIResponder? = self.next
        while parentResponder != nil {
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
            parentResponder = parentResponder?.next
        }
        return nil
    }
}
