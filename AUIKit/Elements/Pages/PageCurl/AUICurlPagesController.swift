//
//  AUICurlPagesController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 27.12.2021.
//

import UIKit

public protocol AUICurlPagesController {
    
    var navigationOrientation: UIPageViewController.NavigationOrientation { get set }
    
    var pageControllers: [AUIPageController] { get set }
    
    // MARK: Select
    
    func selectPageController(_ pageController: AUIPageController)
  
    func selectPageControllerAnimated(_ pageController: AUIPageController, navigationDirection: UIPageViewController.NavigationDirection, completion: ((Bool) -> Void)?)
  
    var selectedPageController: AUIPageController? { get }
  
}
