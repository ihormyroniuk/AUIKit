import UIKit

public protocol AUIRefreshControlController: AUIControlController {
  
  // MARK: Refresh Control
  
  var refreshControl: UIRefreshControl? { get set }
  
  // MARK: Refreshing
  
  func beginRefreshing()
  
  func endRefreshing()
}
