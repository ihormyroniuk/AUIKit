//
//  AUICurlPagesController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 27.12.2021.
//

import UIKit

public protocol AUICurlPagesController {
    
    // MARK: Settings
    
    var spineLocation: AUICurlPagesControllerSpineLocation? { get set }
    
    // MARK: Pages
    
    var pageControllers: [AUIPageController] { get set }
    
    // MARK: Select
    
    func selectPageController(_ pageController: AUIPageController)
  
    func selectPageControllerAnimated(_ pageController: AUIPageController, navigationDirection: UIPageViewController.NavigationDirection, completion: ((Bool) -> Void)?)
  
    var selectedPageController: AUIPageController? { get }
  
}

public struct AUICurlPagesControllerSpineLocation {
    let unknown: UIPageViewController.SpineLocation
    let portrait: UIPageViewController.SpineLocation
    let portraitUpsideDown: UIPageViewController.SpineLocation
    let landscapeLeft: UIPageViewController.SpineLocation
    let landscapeRight: UIPageViewController.SpineLocation
}
