//
//  AUIScrollPageViewController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 26.12.2021.
//

import UIKit

public protocol AUIScrollPageViewController {
    
    // MARK: Select
  
    func selectPageController(_ pageController: AUIPageViewController)
  
    func selectedPageController() -> AUIPageViewController?
  
}
