import AUIKit

protocol PickerViewsScreenViewControllerDelegate: AnyObject {
    func pickerViewsScreenViewControllerBack(_ pickerViewsScreenViewController: PickerViewsScreenViewController)
}

final class PickerViewsScreenViewController: UIViewController {
    
    // MARK: - Data
    
    struct City: Hashable {
        let id: String = UUID().uuidString
        let name: String
    }
    
    struct Country: Hashable {
        let id: String = UUID().uuidString
        let name: String
        let flag: String
        let cities: [City]
    }
    
    private var countries: [Country] = []
    
    private func loadData() {
        var countries: [Country] = []
        let ukraineCountryKyivCity = City(name: "Kyiv")
        let ukraineCountryKharkivCity = City(name: "Kharkiv")
        let ukraineCountryOdesaCity = City(name: "Odesa")
        let ukraineCountryDniproCity = City(name: "Dnipro")
        let ukraineCountry = Country(name: "Ukraine", flag: "🇺🇦", cities: [ukraineCountryKyivCity, ukraineCountryKharkivCity, ukraineCountryOdesaCity, ukraineCountryDniproCity])
        countries.append(ukraineCountry)
        let polandCountryWarsawCity = City(name: "Warsaw")
        let polandCountryWroclawCity = City(name: "Wrocław")
        let polandCountry = Country(name: "Poland", flag: "🇵🇱", cities: [polandCountryWarsawCity, polandCountryWroclawCity])
        countries.append(polandCountry)
        self.countries = countries
    }
    
    // MARK: Delegate
    
    weak var delegate: PickerViewsScreenViewControllerDelegate?
    
    // MARK: View
    
    override func loadView() {
        view = ScreenView()
    }
    
    private var screenView: ScreenView! {
        return view as? ScreenView
    }
    
    // MARK: Components
    
    private let titlePickerViewController = AUIEmptyTitlePickerViewController()
    private var countriesTitleComponentController: AUITitlePickerViewComponentController?
    private var citiesTitleComponentController: AUITitlePickerViewComponentController?
    
    private let viewPickerViewController = AUIEmptyViewPickerViewController()
    private var countriesViewComponentController: AUIViewPickerViewComponentController?
    private var citiesViewComponentController: AUIViewPickerViewComponentController?
    
    // MARK: Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        screenView.backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        setContent()
        titlePickerViewController.pickerView = screenView.titlePickerView
        viewPickerViewController.pickerView = screenView.viewPickerView
        loadTitlePickerViewControllerContent()
        loadViewPickerViewControllerContent()
    }

    // MARK: Actions
    
    @objc private func back() {
        delegate?.pickerViewsScreenViewControllerBack(self)
    }
    
    private func didSelectCountry(_ country: Country) {
        let cities = country.cities
        if let citiesTitleComponentController = citiesTitleComponentController {
            var citiesTitleItemControllers: [AUITitlePickerViewItemController] = []
            for city in cities {
                let name = city.name
                let cityTitleItemController = AUIEmptyTitlePickerViewItemController(title: name)
                citiesTitleItemControllers.append(cityTitleItemController)
            }
            titlePickerViewController.reloadTitleComponentController(citiesTitleComponentController, titleItemControllers: citiesTitleItemControllers)
            if let firstCityTitleItemController = citiesTitleItemControllers.first {
                titlePickerViewController.selectItemController(firstCityTitleItemController, atComponentController: citiesTitleComponentController, animated: false)
            }
        }
        if let citiesViewComponentController = citiesViewComponentController {
            var citiesViewItemControllers: [CityViewPickerViewItemController] = []
            for city in cities {
                let cityViewItemController = CityViewPickerViewItemController(city: city)
                citiesViewItemControllers.append(cityViewItemController)
            }
            viewPickerViewController.reloadViewComponentController(citiesViewComponentController, viewItemControllers: citiesViewItemControllers)
            if let firstCityViewItemController = citiesViewItemControllers.first {
                viewPickerViewController.selectItemController(firstCityViewItemController, atComponentController: citiesViewComponentController, animated: false)
            }
        }
    }
    
    // MARK: Content
    
    private func setContent() {
        screenView.titleLabel.text = "PickerViews"
    }
    
    private func loadTitlePickerViewControllerContent() {
        var countriesTitleItemControllers: [AUITitlePickerViewItemController] = []
        for country in countries {
            let name = country.name
            let countryTitleItemController = AUIEmptyTitlePickerViewItemController(title: name)
            countryTitleItemController.didSelect = { [weak self] in
                guard let self = self else { return }
                self.didSelectCountry(country)
            }
            countriesTitleItemControllers.append(countryTitleItemController)
        }
        let countriesTitleComponentController = AUIEmptyTitlePickerViewComponentController(titleItemControllers: countriesTitleItemControllers)
        self.countriesTitleComponentController = countriesTitleComponentController
        let firstCountry = countries.first
        let cities = firstCountry?.cities ?? []
        var citiesTitleItemControllers: [AUITitlePickerViewItemController] = []
        for city in cities {
            let name = city.name
            let cityTitleItemController = AUIEmptyTitlePickerViewItemController(title: name)
            citiesTitleItemControllers.append(cityTitleItemController)
        }
        let citiesTitleComponentController = AUIEmptyTitlePickerViewComponentController(titleItemControllers: citiesTitleItemControllers)
        self.citiesTitleComponentController = citiesTitleComponentController
        titlePickerViewController.loadTitleComponentControllers([countriesTitleComponentController, citiesTitleComponentController])
    }
    
    private func loadViewPickerViewControllerContent() {
        var countriesViewItemControllers: [AUIViewPickerViewItemController] = []
        for country in countries {
            let countryViewItemController = CountryViewPickerViewItemController(country: country)
            countryViewItemController.didSelect = { [weak self] in
                guard let self = self else { return }
                self.didSelectCountry(country)
            }
            countriesViewItemControllers.append(countryViewItemController)
        }
        class CountriesViewComponentController: AUIEmptyViewPickerViewComponentController {
            override func width(_ size: CGSize) -> CGFloat { return size.width * 0.3 }
            override func height(_ size: CGSize) -> CGFloat { return 90 }
        }
        let countriesViewComponentController = CountriesViewComponentController(viewItemControllers: countriesViewItemControllers)
        self.countriesViewComponentController = countriesViewComponentController
        let firstCountry = countries.first
        let cities = firstCountry?.cities ?? []
        var citiesViewItemControllers: [CityViewPickerViewItemController] = []
        for city in cities {
            let cityViewItemController = CityViewPickerViewItemController(city: city)
            citiesViewItemControllers.append(cityViewItemController)
        }
        class CitiesViewComponentController: AUIEmptyViewPickerViewComponentController {
            override func width(_ size: CGSize) -> CGFloat { return size.width * 0.3 }
            override func height(_ size: CGSize) -> CGFloat { return 30 }
        }
        let citiesViewComponentController = CitiesViewComponentController(viewItemControllers: citiesViewItemControllers)
        self.citiesViewComponentController = citiesViewComponentController
        viewPickerViewController.loadViewComponentControllers([countriesViewComponentController, citiesViewComponentController])
    }
    
}
