//
//  InteractiveLabelScreenController.swift
//  AUIKitDemo
//
//  Created by Ihor Myroniuk on 22.07.2020.
//

import UIKit
import AUIKit

protocol InteractiveLabelsScreenViewControllerDelegate: AnyObject {
    func interactiveLabelScreenViewControllerBack(_ interactiveLabelScreenViewController: InteractiveLabelsScreenViewController)
}

class InteractiveLabelsScreenViewController: UIViewController, UITextViewDelegate {
    
    // MARK: Delegate
    
    weak var delegate: InteractiveLabelsScreenViewControllerDelegate?
    
    // MARK: View
    
    override func loadView() {
        view = InteractiveLabelsScreenView()
    }
    
    private var interactiveLabelScreenView: InteractiveLabelsScreenView! {
        return view as? InteractiveLabelsScreenView
    }
    
    // MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactiveLabelScreenView.interactiveLabel.addTarget(self, action: #selector(interactiveLabelTouchUpInsideEventAction(_:_:)), for: .touchUpInside)
        interactiveLabelScreenView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        setContent()
    }
    
    // MARK: Actions
    
    @objc private func back() {
        delegate?.interactiveLabelScreenViewControllerBack(self)
    }
    
    // MARK: Events
    
    @objc private func interactiveLabelTouchUpInsideEventAction(_ interactiveLabel: AUIInteractiveLabel, _ key: AUIInteractiveLabelEvent) {
        print(key.interaction)
    }
    
    // MARK: Content
    
    private func setContent() {
        interactiveLabelScreenView.titleLabel.text = "Interactive Labels"
        setInteractiveLabelText()
    }
    
    private func setInteractiveLabelText() {
        let interactiveText = "пользовательским соглашением"
        let text = String(format: "Нажимая «Далее», Вы соглашаетесь с пользовательским соглашением.", interactiveText)
        interactiveLabelScreenView.setInteractiveLabelText(agree: text, termsAndConditions: (interactiveText, "ffff"))
        interactiveLabelScreenView.setTextViewText(agree: text, termsAndConditions: (interactiveText, "ffff"))
        interactiveLabelScreenView.textView.delegate = self
    }
    
    func textView(_ textView: UITextView, shouldInteractWith url: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print(url)
        return true
    }
    
}
