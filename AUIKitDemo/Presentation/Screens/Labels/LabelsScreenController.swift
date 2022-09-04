import AUIKit

protocol LabelsScreenControllerDelegate: AnyObject {
    func labelsScreenControllerBack(_ labelsScreenController: LabelsScreenController)
}

class LabelsScreenController: UIViewController {
    
    // MARK: Delegate
    
    weak var delegate: LabelsScreenControllerDelegate?
    
    // MARK: View
    
    override func loadView() {
        view = LabelsScreenView()
    }
    
    private var labelsScreenView: LabelsScreenView! {
        return view as? LabelsScreenView
    }
    
    // MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelsScreenView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        setContent()
    }

    // MARK: Actions
    
    @objc private func back() {
        delegate?.labelsScreenControllerBack(self)
    }
    
    // MARK: Content
    
    private func setContent() {
        labelsScreenView.titleLabel.text = "Labels"
        let text = "I've seen things you people wouldn't believe. Attack ships on fire off the shoulder of Orion. I watched C–beams glitter in the darkness at Tannhauser Gate. All those moments will be lost in time like tears in rain. Time to die."
        labelsScreenView.label.text = text
        labelsScreenView.attributedLabel.text = text
    }
    
}
