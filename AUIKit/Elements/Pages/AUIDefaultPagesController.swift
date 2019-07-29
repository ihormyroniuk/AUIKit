//
//  PagesViewController.swift
//  Level
//
//  Created by Ihor Myroniuk on 8/30/18.
//  Copyright © 2018 Brander. All rights reserved.
//

import UIKit

open class AUIDefaultPagesController: AUIDefaultViewController, AUIPagesViewController {
  
  // MARK: Delegates
  
  open var didTransitToPageObservers = NSHashTable<AnyObject>.weakObjects()
  
  public func addDidTransitToPageObserver(_ observer: AUIPagesViewControllerDidTransitToPageObserver) {
    didTransitToPageObservers.add(observer)
  }
  
  public func removeDidTransitToPageObserver(_ observer: AUIPagesViewControllerDidTransitToPageObserver) {
    didTransitToPageObservers.remove(observer)
  }
  
  private let pageViewControllerDataSourceDelegate = AUIPageViewControllerDataSourceDelegateProxy()
  
  // MARK: Controllers
  
  private var pagesViewController: AUISelfLayoutPageViewController?
  open var pageControllers: [AUIPageViewController] = []
  
  // MARK: Initializer
  
  public init(transitionStyle: UIPageViewController.TransitionStyle = .scroll,
              navigationOrientation: UIPageViewController.NavigationOrientation = .horizontal,
              options: [UIPageViewController.OptionsKey : Any] = [:]) {
    self.transitionStyle = transitionStyle
    self.navigationOrientation = navigationOrientation
    self.options = options
  }
  
  // MARK: State
  
  private var transitionStyle: UIPageViewController.TransitionStyle
  private var navigationOrientation: UIPageViewController.NavigationOrientation
  private var options: [UIPageViewController.OptionsKey : Any]
  
  open var pagesCount: Int { return pageControllers.count }
  open var currentPageNumbers: [Int] {
    guard let containerPageViewControllers = pagesViewController?.viewControllers as? [NumberedContainerViewController] else { return [] }
    let currentPageNumbers: [Int] = containerPageViewControllers.map({ Int($0.number) })
    return currentPageNumbers
  }
  open var currentPageControllers: [AUIPageViewController] {
    let currentPageNumbers = self.currentPageNumbers
    return pageControllers.enumerated().filter({ currentPageNumbers.contains($0.offset) }).map({$1})
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
    let pagesViewController = AUISelfLayoutPageViewController(containerView: view, transitionStyle: transitionStyle, navigationOrientation: navigationOrientation, options: options)
    self.pagesViewController = pagesViewController
    setupPageViewController()
    reload()
  }
  
  open override func unsetupView() {
    super.unsetupView()
    pagesViewController?.view.removeFromSuperview()
    pagesViewController = nil
  }
  
  // MARK: Reloal
  
  open func reload() {
    if pagesViewController?.spineLocation == .mid {
      //if pagesViewController
    } else {
      guard let pageViewController = pageControllers.first else { return }
      let containerPageViewController = NumberedContainerViewController(number: 0, viewController: pageViewController.viewController)
      pagesViewController?.setViewControllers([containerPageViewController], direction: .forward, animated: false, completion: nil)
      for object in didTransitToPageObservers.allObjects {
        guard let observer = object as? AUIPagesViewControllerDidTransitToPageObserver else { continue }
        observer.pagesViewController(self, didTransitToPageViewControllers: currentPageControllers)
      }
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
    for object in didTransitToPageObservers.allObjects {
      guard let observer = object as? AUIPagesViewControllerDidTransitToPageObserver else { continue }
      observer.pagesViewController(self, didTransitToPageViewControllers: currentPageControllers)
    }
  }
  
}

private class AUIPageViewControllerDataSourceDelegateProxy: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
  
  weak var delegate: AUIDefaultPagesController?
  
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
    viewController.view.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(viewController.view)
    addChild(viewController)
    viewController.didMove(toParent: viewController)
  }
  
  @available(*, unavailable)
  convenience required init?(coder aDecoder: NSCoder) { return nil }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    viewController.view.frame = view?.bounds ?? .zero
  }
}
