import UIKit

open class AUIEmptyImageViewController: AUIEmptyViewController, AUIImageViewController {
  
    // MARK: - UIImageView
  
    open var imageView: UIImageView? {
        set { view = newValue }
        get { return view as? UIImageView }
    }
  
    open override func setupView() {
        super.setupView()
        setupImageView()
    }
  
    open func setupImageView() {
        imageView?.image = image
    }
  
    open override func unsetupView() {
        super.unsetupView()
        unsetupImageView()
    }
  
    open func unsetupImageView() {
        imageView?.image = image
    }
  
    // MARK: - Image
  
    open var image: UIImage? {
        didSet {
            didSetImage()
        }
    }
    open func didSetImage() {
        imageView?.image = image
    }
  
}
