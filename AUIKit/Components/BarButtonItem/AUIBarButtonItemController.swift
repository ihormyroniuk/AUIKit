import UIKit

public protocol AUIBarButtonItemControllerDidSelectObserver: AnyObject {
  func barButtonItemControllerDidSelect(_ barButtonItemController: AUIBarButtonItemController)
}

public protocol AUIBarButtonItemController: AUIBarItemController {
  
  // MARK: Observers
  
  func addDidSelectObserver(_ observer: AUIBarButtonItemControllerDidSelectObserver)
  func removeDidSelectObserver(_ observer: AUIBarButtonItemControllerDidSelectObserver)
  
  // MARK: Bar Button Item
  
  var barButtonItem: UIBarButtonItem? { get set }
  
}
