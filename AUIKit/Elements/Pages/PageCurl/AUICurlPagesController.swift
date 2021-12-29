//
//  AUICurlPagesController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 27.12.2021.
//

import UIKit

public protocol AUICurlPagesController {
    
    // MARK: Settings
    
    var orientationSpineLocation: AUICurlPagesControllerOrientationSpineLocation? { get set }
    
    var spineLocation: UIPageViewController.SpineLocation { get }
    
    //var spineLocation: UIPageViewController.SpineLocation? { get }
    
    // MARK: Pages
    
    var pageControllers: [AUIPageController] { get set }
    
    // MARK: Select
    
    func selectPageController(_ pageController: AUIPageController)
  
    func selectPageControllerAnimated(_ pageController: AUIPageController, navigationDirection: UIPageViewController.NavigationDirection, completion: ((Bool) -> Void)?)
  
    var selectedPageController: AUIPageController? { get }
  
}

public struct AUICurlPagesControllerOrientationSpineLocation {
    let portrait: UIPageViewController.SpineLocation
    let portraitUpsideDown: UIPageViewController.SpineLocation
    let landscapeLeft: UIPageViewController.SpineLocation
    let landscapeRight: UIPageViewController.SpineLocation
    let unknown: UIPageViewController.SpineLocation
    
    public init(portrait: UIPageViewController.SpineLocation, portraitUpsideDown: UIPageViewController.SpineLocation, landscapeLeft: UIPageViewController.SpineLocation, landscapeRight: UIPageViewController.SpineLocation, unknown: UIPageViewController.SpineLocation) {
        self.unknown = unknown
        self.portrait = portrait
        self.portraitUpsideDown = portraitUpsideDown
        self.landscapeLeft = landscapeLeft
        self.landscapeRight = landscapeRight
    }
}
