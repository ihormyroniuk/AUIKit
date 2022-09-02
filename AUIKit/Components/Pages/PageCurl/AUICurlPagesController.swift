import UIKit

public protocol AUICurlPagesController {
    
    // MARK: Settings
        
    var portraitSpineLocation: UIPageViewController.SpineLocation? { get set }
    var portraitUpsideDownSpineLocation: UIPageViewController.SpineLocation? { get set }
    var landscapeLeftSpineLocation: UIPageViewController.SpineLocation? { get set }
    var landscapeRightSpineLocation: UIPageViewController.SpineLocation? { get set }
    var unknownSpineLocation: UIPageViewController.SpineLocation? { get set }
    var spineLocation: UIPageViewController.SpineLocation { get }
        
    // MARK: Pages
    
    var pageControllers: [AUIPageController]? { get set }
    
    var displayedPageController: AUIPageController? { get }
    
    func displayPageController(_ pageController: AUIPageController)
  
    func displayPageControllerAnimated(_ pageController: AUIPageController, navigationDirection: UIPageViewController.NavigationDirection, completion: ((Bool) -> Void)?)
  
}
