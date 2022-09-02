import UIKit

public protocol AUIScrollPagesController {
    
    // MARK: Settings
    
    var navigationOrientation: UIPageViewController.NavigationOrientation { get set }
    
    var interPageSpacing: CGFloat? { get set }
    
    var isLooping: Bool? { get set }
    
    // MARK: - Pages
    
    var pageControllers: [AUIPageController]? { get set }
    
    var displayedPageController: AUIPageController? { get }
    
    func displayPageController(_ pageController: AUIPageController)
  
    func displayPageControllerAnimated(_ pageController: AUIPageController, navigationDirection: UIPageViewController.NavigationDirection, completion: ((Bool) -> Void)?)
  
}
