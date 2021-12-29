//
//  AUIEmptyCurlPagesController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 27.12.2021.
//

import UIKit

open class AUIEmptyCurlPagesController: AUIEmptyViewController, AUICurlPagesController {
    
    // MARK: Settings
    
    open var orientationSpineLocation: AUICurlPagesControllerOrientationSpineLocation?
    
    open var spineLocation: UIPageViewController.SpineLocation = .min
    
    // MARK: Pages
    
    open var pageControllers: [AUIPageController] = []
    
    // MARK: Select
    
    open func selectPageController(_ pageController: AUIPageController) {
        if spineLocation == .mid {
            guard let index = pageControllers.firstIndex(where: { $0 === pageController }) else { return }
            if index % 2 == 0 {
                let leftContainerPageViewController = NumberedContainerViewController(number: index, viewController: pageController.viewController)
                let rightContainerPageViewController = NumberedContainerViewController(number: index + 1, viewController: pageControllers[index + 1].viewController)
                pagesViewController?.setViewControllers([leftContainerPageViewController, rightContainerPageViewController], direction: .forward, animated: false)
            } else {
                let rightContainerPageViewController = NumberedContainerViewController(number: index, viewController: pageController.viewController)
                let leftContainerPageViewController = NumberedContainerViewController(number: index - 1, viewController: pageControllers[index - 1].viewController)
                pagesViewController?.setViewControllers([leftContainerPageViewController, rightContainerPageViewController], direction: .forward, animated: false)
            }
        } else {
            guard let index = pageControllers.firstIndex(where: { $0 === pageController }) else { return }
            let containerPageViewController = NumberedContainerViewController(number: index, viewController: pageController.viewController)
            pagesViewController?.setViewControllers([containerPageViewController], direction: .forward, animated: false)
        }
    }
  
    open func selectPageControllerAnimated(_ pageController: AUIPageController, navigationDirection: UIPageViewController.NavigationDirection, completion: ((Bool) -> Void)?) {
        guard let index = pageControllers.firstIndex(where: { $0 === pageController }) else { return }
        let containerPageViewController = NumberedContainerViewController(number: index, viewController: pageController.viewController)
        pagesViewController?.setViewControllers([containerPageViewController], direction: navigationDirection, animated: true, completion: { [weak self] finished in
            guard let self = self else { return }
            self.selectedPageController?.didSelect()
            completion?(finished)
        })
    }
    
    open var selectedPageController: AUIPageController? {
        guard let currentPageNumber = self.currentPageNumber else { return nil }
        return pageControllers[currentPageNumber]
    }
  
    open var currentPageNumber: Int? {
        guard let containerPageViewController = pagesViewController?.viewControllers?.first as? NumberedContainerViewController else { return nil }
        let currentPageNumber: Int = containerPageViewController.number
        return currentPageNumber
    }
  
    // MARK: Controllers
  
    private var pagesViewController: AUISelfLayoutPageViewController?
    
    private let pageViewControllerDataSourceDelegate = AUIPageViewControllerDataSourceDelegateProxy()
    
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
        let options = [UIPageViewController.OptionsKey.spineLocation : NSNumber(value: spineLocation.rawValue)]
        let pagesViewController = AUISelfLayoutPageViewController(containerView: view, transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: options)
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
        }
        return nil
  }
  
    open func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let numberedContainerViewController = viewController as? NumberedContainerViewController else { return nil }
        let number = numberedContainerViewController.number
        if number < (pageControllers.count - 1) {
            let afterNumber = number + 1
            let afterPageController = pageControllers[afterNumber]
            let afterNumberedContainerViewController = NumberedContainerViewController(number: afterNumber, viewController: afterPageController.viewController)
            return afterNumberedContainerViewController
        }
        return nil
    }
  
    open func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        selectedPageController?.didSelect()
    }
    
    open func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewController.SpineLocation {
        let spineLocation: UIPageViewController.SpineLocation
        if let orientationSpineLocation = orientationSpineLocation {
            if orientation == .portrait {
                spineLocation = orientationSpineLocation.portrait
            } else if orientation == .portraitUpsideDown {
                spineLocation = orientationSpineLocation.portraitUpsideDown
            } else if orientation == .landscapeLeft {
                spineLocation = orientationSpineLocation.landscapeLeft
            } else if orientation == .landscapeRight {
                spineLocation = orientationSpineLocation.landscapeRight
            } else {
                spineLocation = orientationSpineLocation.unknown
            }
        } else {
            spineLocation = .min
        }
        self.spineLocation = spineLocation
        if spineLocation == .mid {
            pagesViewController?.isDoubleSided = true
        } else {
            pagesViewController?.isDoubleSided = false
        }
        if let selectedPageController = selectedPageController {
            selectPageController(selectedPageController)
        }
        return spineLocation
    }
  
}

private class AUIPageViewControllerDataSourceDelegateProxy: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
  
    weak var delegate: AUIEmptyCurlPagesController?
  
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return delegate?.pageViewController(pageViewController, viewControllerBefore: viewController)
    }
  
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return delegate?.pageViewController(pageViewController, viewControllerAfter: viewController)
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

private class NumberedContainerViewController: UIViewController {
  
    let number: Int
    private let viewController: UIViewController
  
    init(number: Int, viewController: UIViewController) {
        self.number = number
        self.viewController = viewController
        super.init(nibName: nil, bundle: nil)
        view.addSubview(viewController.view)
        addChild(viewController)
        viewController.didMove(toParent: self)
    }
  
    @available(*, unavailable)
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
