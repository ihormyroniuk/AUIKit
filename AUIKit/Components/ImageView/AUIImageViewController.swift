import UIKit

public protocol AUIImageViewController: AUIViewController {
  
    // MARK: - UIImageView
  
    var imageView: UIImageView? { get set }
  
    // MARK: - Image
  
    var image: UIImage? { get set }
  
}
