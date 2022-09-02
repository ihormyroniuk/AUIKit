import UIKit

open class AUITextView: UITextView {
  
  // MARK: - Initialization

   public override init(frame: CGRect = .zero, textContainer: NSTextContainer? = nil) {
       super.init(frame: frame, textContainer: textContainer)
       setup()
   }

  @available(*, unavailable)
   public required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       setup()
   }

   // MARK: - Setup

   open func setup() {

   }
  
}
