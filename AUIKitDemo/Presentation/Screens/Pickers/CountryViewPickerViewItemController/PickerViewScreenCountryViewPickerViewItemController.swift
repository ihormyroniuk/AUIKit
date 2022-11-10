import UIKit
import AUIKit

extension PickerViewsScreenViewController {
class CountryViewPickerViewItemController: AUIEmptyViewPickerViewItemController {
    
    let country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    override func view(reusingView view: UIView?) -> UIView {
        let view = CountryView()
        view.flagLabel.text = country.flag
        view.nameLabel.text = country.name
        return view
    }
        
}
}

extension PickerViewsScreenViewController.CountryViewPickerViewItemController {
class CountryView: AUIView {
    
    let flagLabel = UILabel()
    let nameLabel = UILabel()
    
    override func setup() {
        super.setup()
        backgroundColor = .clear
        addSubview(flagLabel)
        setupFlagLabel()
        addSubview(nameLabel)
        setupNameLabel()
    }
    
    private func setupFlagLabel() {
        flagLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    }
    
    private func setupNameLabel() {
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutFlagLabel()
        layoutNameLabel()
    }
        
    private func layoutFlagLabel() {
        let x: CGFloat = 0
        let y: CGFloat = 0
        let height: CGFloat = bounds.height
        let width = flagLabel.sizeThatFits(CGSize(width: bounds.width, height: height)).width
        let frame = CGRect(x: x, y: y, width: width, height: height)
        flagLabel.frame = frame
    }
    
    private func layoutNameLabel() {
        let x: CGFloat = flagLabel.frame.maxX + 6
        let y: CGFloat = 0
        let height: CGFloat = bounds.height
        let width = nameLabel.sizeThatFits(CGSize(width: bounds.width - x, height: height)).width
        let frame = CGRect(x: x, y: y, width: width, height: height)
        nameLabel.frame = frame
    }
    
}
}

extension PickerViewsScreenViewController {
class CityViewPickerViewItemController: AUIEmptyViewPickerViewItemController {
    
    let city: City
    
    init(city: City) {
        self.city = city
    }
    
    override func view(reusingView view: UIView?) -> UIView {
        let view = CityView()
        view.nameLabel.text = city.name
        return view
    }
        
}
}

extension PickerViewsScreenViewController.CityViewPickerViewItemController {
class CityView: AUIView {
    
    let nameLabel = UILabel()
    
    override func setup() {
        super.setup()
        backgroundColor = .clear
        addSubview(nameLabel)
        setupNameLabel()
    }
    
    private func setupNameLabel() {
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutNameLabel()
    }
    
    private func layoutNameLabel() {
        let x: CGFloat = 0
        let y: CGFloat = 0
        let height: CGFloat = bounds.height
        let width = nameLabel.sizeThatFits(CGSize(width: bounds.width - x, height: height)).width
        let frame = CGRect(x: x, y: y, width: width, height: height)
        nameLabel.frame = frame
    }
    
}
}
