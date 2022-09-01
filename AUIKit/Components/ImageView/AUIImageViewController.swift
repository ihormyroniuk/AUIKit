import UIKit

public protocol AUIImageViewController: AUIViewController {
  
    // MARK: - ImageView
  
    var imageView: UIImageView? { get set }
  
    // MARK: - Image
  
    var image: UIImage? { get set }
  
}
