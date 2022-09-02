import UIKit

public extension UIPageControl {
  
    var preferredSize: CGSize {
        return size(forNumberOfPages: numberOfPages)
    }
  
    var preferredWidth: CGFloat {
        return size(forNumberOfPages: numberOfPages).width
    }
  
    var preferredHeight: CGFloat {
        return size(forNumberOfPages: numberOfPages).height
    }
  
}
