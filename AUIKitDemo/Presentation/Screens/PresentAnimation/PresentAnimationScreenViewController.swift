import AUIKit

class PresentAnimationScreenViewController: UIViewController {

    // MARK: View
    
    override func loadView() {
        view = PresentAnimationScreenView()
    }
    
    private var presentAnimationScreenView: PresentAnimationScreenView! {
        return view as? PresentAnimationScreenView
    }
    
}
