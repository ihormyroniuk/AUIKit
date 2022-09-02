import UIKit

open class AUIEmptyCountDownDurationDatePickerController: AUIEmptyControlController, AUICountDownDurationDatePickerController {
    
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
        datePicker?.datePickerMode = .countDownTimer
        datePicker?.countDownDuration = countDownDuration
        datePicker?.minuteInterval = minuteInterval
    }
    
    open override func unsetupControl() {
        super.unsetupControl()
        unsetupDatePicker()
    }
  
    func unsetupDatePicker() {
        
    }
  
    // MARK: - Count Down Duration
  
    public var countDownDuration: TimeInterval = 0.0 {
        didSet {
            didSetCountDownDuration(oldValue)
        }
    }
    open func didSetCountDownDuration(_ oldValue: TimeInterval) {
        if oldValue != countDownDuration {
            datePicker?.countDownDuration = countDownDuration
            controlValueChangedEventAction()
        }
    }
  
    // MARK: - Minute Interval
  
    public var minuteInterval: Int = 1 {
        didSet {
            didSetMinuteInterval(oldValue)
        }
    }

    open func didSetMinuteInterval(_ oldValue: Int) {
        datePicker?.minuteInterval = minuteInterval
    }
  
    // MARK: - Events
  
    open override func controlValueChangedEventAction() {
        super.controlValueChangedEventAction()
        if let countDownDuration = datePicker?.countDownDuration {
            self.countDownDuration = countDownDuration
        }
    }
  
}
