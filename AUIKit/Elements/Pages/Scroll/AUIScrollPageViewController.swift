//
//  AUIScrollPageViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 26.12.2021.
//

import UIKit

public protocol AUIScrollPageViewController {
    
    var navigationOrientation: UIPageViewController.NavigationOrientation { get }
    
    var interPageSpacing: CGFloat? { get }
    
    // MARK: Select
    
    func selectPageController(_ pageController: AUIPageViewController)
  
    func selectPageControllerAnimated(_ pageController: AUIPageViewController, navigationDirection: UIPageViewController.NavigationDirection, completion: ((Bool) -> Void)?)
  
    func selectedPageController() -> AUIPageViewController?
  
}
