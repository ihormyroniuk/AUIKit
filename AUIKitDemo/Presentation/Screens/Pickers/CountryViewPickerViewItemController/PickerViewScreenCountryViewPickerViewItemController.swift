import UIKit
import AUIKit

extension PickerViewsScreenViewController {
class CountryViewPickerViewItemController: AUIEmptyViewPickerViewItemController {
    
    let country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    override func view(reusingView view: UIView?) -> UIView {
        let view = View()
        view.flagLabel.text = country.flag
        return view
    }
        
}
}

extension PickerViewsScreenViewController.CountryViewPickerViewItemController {
class View: AUIView {
    
    let flagLabel = UILabel()
    let nameLabel = UILabel()
    
    override func setup() {
        super.setup()
        backgroundColor = .white
        addSubview(flagLabel)
        setupFlagLabel()
        addSubview(nameLabel)
    }
    
    private func setupFlagLabel() {
        flagLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutFlagLabel()
    }
        
    private func layoutFlagLabel() {
//        let x: CGFloat = 0
//        let y = navigationBarView.frame.maxY
//        let width = bounds.width
//        let height = titlePickerView.sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude)).height
//        let frame = CGRect(x: x, y: y, width: width, height: height)
        flagLabel.frame = bounds
    }
    
}
}
