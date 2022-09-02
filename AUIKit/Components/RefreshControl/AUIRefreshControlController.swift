import UIKit

public protocol AUIRefreshControlController: AUIControlController {
  
    // MARK: - UIRefreshControl
  
    var refreshControl: UIRefreshControl? { get set }
  
    // MARK: - Refreshing
  
    func beginRefreshing()
  
    func endRefreshing()
    
}
