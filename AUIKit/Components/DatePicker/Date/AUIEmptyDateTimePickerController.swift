import UIKit

open class AUIEmptyDateTimePickerController: AUIEmptyControlController, AUIDateTimePickerController {
    
    // MARK: - UIDatePicker
  
    public var datePicker: UIDatePicker? {
        set { view = newValue }
        get { return view as? UIDatePicker }
    }
  
    open override func setupControl() {
        super.setupControl()
        setupDatePicker()
    }
    
    open func setupDatePicker() {
        datePicker?.datePickerMode = mode.datePickerMode
        datePicker?.minimumDate = minimumDate
        datePicker?.maximumDate = maximumDate
        datePicker?.locale = locale
        datePicker?.calendar = calendar
        datePicker?.timeZone = timeZone
        datePicker?.setDate(date, animated: false)
    }
    
    open override func unsetupControl() {
        super.unsetupControl()
        unsetupDatePicker()
    }
  
    func unsetupDatePicker() {
        
    }
  
    // MARK: - Mode
  
    public var mode: AUIDateTimePickerControllerMode = .dateAndTime {
        didSet {
            didSetMode(oldValue)
        }
    }
    open func didSetMode(_ oldValue: AUIDateTimePickerControllerMode) {
        datePicker?.datePickerMode = mode.datePickerMode
    }
  
    // MARK: - Date
  
    private var _date: Date = Date()
    public var date: Date {
        return _date
    }
    
    public func setDate(_ date: Date, animated: Bool) {
        let oldValue = _date
        _date = date
        didSetDate(oldValue, animated: animated)
    }
    
    open func didSetDate(_ oldValue: Date, animated: Bool) {
        if oldValue != date {
            datePicker?.setDate(date, animated: animated)
            controlValueChangedEventAction()
        }
    }
  
    // MARK: - Minimum Date
  
    public var minimumDate: Date? = nil {
        didSet {
            didSetMinimumDate(oldValue)
        }
    }
    open func didSetMinimumDate(_ oldValue: Date?) {
        datePicker?.minimumDate = minimumDate
        if let minimumDate = minimumDate, minimumDate > date {
            setDate(minimumDate, animated: false)
        }
    }
  
    // MARK: - Maximum Date
  
    public var maximumDate: Date? = nil {
        didSet {
            didSetMaximumDate(oldValue)
        }
    }
    open func didSetMaximumDate(_ oldValue: Date?) {
        datePicker?.maximumDate = maximumDate
        if let maximumDate = maximumDate, maximumDate < date {
            setDate(maximumDate, animated: false)
        }
    }
  
    // MARK: - Locale
  
    public var locale: Locale? {
        didSet {
            didSetLocale(oldValue)
        }
    }
    open func didSetLocale(_ oldValue: Locale?) {
        datePicker?.locale = locale
    }
  
    // MARK: - Calendar
  
    public var calendar: Calendar = Calendar.current {
        didSet {
            didSetCalendar(oldValue)
        }
    }
    open func didSetCalendar(_ oldValue: Calendar) {
        datePicker?.calendar = calendar
    }
  
    // MARK: - Time Zone
  
    public var timeZone: TimeZone? {
        didSet {
            didSetTimeZone(oldValue)
        }
    }
    open func didSetTimeZone(_ oldValue: TimeZone?) {
        datePicker?.timeZone = timeZone
    }
  
    // MARK: - Events
  
    open override func controlValueChangedEventAction() {
        super.controlValueChangedEventAction()
        if let date = datePicker?.date {
            setDate(date, animated: true)
        }
    }
  
}
