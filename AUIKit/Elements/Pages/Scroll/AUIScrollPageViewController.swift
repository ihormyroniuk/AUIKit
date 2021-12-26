//
//  AUIScrollPageViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 26.12.2021.
//

import UIKit

public protocol AUIScrollPageViewController {
    
    var navigationOrientation: UIPageViewController.NavigationOrientation { get set }
    
    var interPageSpacing: CGFloat? { get set }
    
    var isInfiniteScroll: Bool? { get set }
    
    // MARK: Select
    
    func selectPageController(_ pageController: AUIPageViewController)
  
    func selectPageControllerAnimated(_ pageController: AUIPageViewController, navigationDirection: UIPageViewController.NavigationDirection, completion: ((Bool) -> Void)?)
  
    var selectedPageController: AUIPageViewController? { get }
  
}
