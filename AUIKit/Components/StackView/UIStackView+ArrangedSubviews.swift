import UIKit

public extension UIStackView {
  
  func addArrangedSubviews(_ views: [UIView]) {
    views.forEach({ addArrangedSubview($0) })
  }
  
  func removeArrangedSubviews(_ views: [UIView]) {
    views.forEach({
      removeArrangedSubview($0)
      $0.removeFromSuperview()
    })
  }
  
  func removeAllArrangedSubviews() {
    removeArrangedSubviews(arrangedSubviews)
  }
  
}
