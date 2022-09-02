import UIKit

open class AUITextView: UITextView {
  
  // MARK: Initializers

   public override init(frame: CGRect = .zero, textContainer: NSTextContainer? = nil) {
       super.init(frame: frame, textContainer: textContainer)
       setup()
       autoLayout()
   }

  @available(*, unavailable)
   public required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       setup()
       autoLayout()
   }

   // MARK: Setup

   open func setup() {

   }

   // MARK: AutoLayout

   open func autoLayout() {

   }
  
}
