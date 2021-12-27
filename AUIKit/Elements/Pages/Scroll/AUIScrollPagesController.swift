//
//  AUIScrollPageViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 26.12.2021.
//

import UIKit

public protocol AUIScrollPagesController {
    
    // MARK: Settings
    
    var navigationOrientation: UIPageViewController.NavigationOrientation { get set }
    
    var interPageSpacing: CGFloat? { get set }
    
    var isInfiniteScroll: Bool? { get set }
    
    // MARK: Pages
    
    var pageControllers: [AUIPageController] { get set }
    
    // MARK: Select
    
    func selectPageController(_ pageController: AUIPageController)
  
    func selectPageControllerAnimated(_ pageController: AUIPageController, navigationDirection: UIPageViewController.NavigationDirection, completion: ((Bool) -> Void)?)
  
    var selectedPageController: AUIPageController? { get }
  
}
