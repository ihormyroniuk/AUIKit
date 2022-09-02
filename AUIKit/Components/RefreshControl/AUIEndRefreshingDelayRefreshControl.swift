import UIKit

open class AUIEndRefreshingDelayRefreshControl: UIRefreshControl {
  
    open override func didMoveToWindow() {
        super.didMoveToWindow()
        if !isRefreshing {
            super.beginRefreshing()
            super.endRefreshing()
        }
    }
  
    open override func endRefreshing() {
        func superEndRefreshing() {
            super.endRefreshing()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.16) {
            superEndRefreshing()
        }
    }
    
}
