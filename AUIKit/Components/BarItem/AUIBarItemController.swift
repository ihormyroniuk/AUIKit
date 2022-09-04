import UIKit

public protocol AUIBarItemController: AnyObject {
  
    // MARK: - UIBarItem
  
    var barItem: UIBarItem? { get set }
  
    // MARK: - Title
  
    var title: String? { get set }
  
    // MARK: - Image
  
    var image: UIImage? { get set }
    
    var landscapeImagePhone: UIImage? { get set }
    
    @available(iOS 11.0, *)
    var largeContentSizeImage: UIImage? { get set }
  
    // MARK: - Enabled
  
    var isEnabled: Bool { get set }
  
}
