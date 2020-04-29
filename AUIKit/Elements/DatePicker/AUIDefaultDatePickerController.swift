//
//  AUIDefaultDatePickerController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/17/19.
//

import UIKit

open class AUIDefaultDatePickerController: AUIDefaultControlController, AUIDatePickerController {
  
    // MARK: Mode
  
    public var mode: UIDatePicker.Mode = UIDatePicker.Mode.dateAndTime {
        didSet {
            didSetMode(oldValue)
        }
    }
  
    open func didSetMode(_ oldValue: UIDatePicker.Mode?) {
        datePicker?.datePickerMode = mode
    }
  
    // MARK: Date
  
    private var _date: Date = Date()
    public var date: Date {
        return _date
    }
    
    public func setDate(_ date: Date, animated: Bool) {
        let oldValue = date
        _date = date
        didSetDate(oldValue, animated: animated)
    }
  
    open func didSetDate(_ oldValue: Date, animated: Bool) {
        if oldValue != date {
            datePicker?.setDate(date, animated: animated)
            for object in didValueChangedObservers.allObjects {
                guard let observer = object as? AUIControlControllerDidValueChangedObserver else { continue }
                observer.controlControllerDidValueChanged(self)
            }
        }
    }
  
    // MARK: Minimum Date
  
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
  
    // MARK: Maximum Date
  
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
  
    // MARK: Locale
  
    public var locale: Locale? {
        didSet {
            didSetLocale(oldValue)
        }
    }
  
    open func didSetLocale(_ oldValue: Locale?) {
        datePicker?.locale = locale
    }
  
    // MARK: Calendar
  
    public var calendar: Calendar = Calendar.current {
        didSet {
            didSetCalendar(oldValue)
        }
    }
  
    open func didSetCalendar(_ oldValue: Calendar) {
        datePicker?.calendar = calendar
    }
  
    // MARK: Time Zone
  
    public var timeZone: TimeZone? {
        didSet {
            didSetTimeZone(oldValue)
        }
    }
  
    open func didSetTimeZone(_ oldValue: TimeZone?) {
        datePicker?.timeZone = timeZone
    }
  
    // MARK: Count Down Duration
  
    public var countDownDuration: TimeInterval = 0.0 {
        didSet {
            didSetCountDownDuration(oldValue)
        }
    }
  
    open func didSetCountDownDuration(_ oldValue: TimeInterval) {
        if oldValue != countDownDuration {
            datePicker?.countDownDuration = countDownDuration
            for object in didValueChangedObservers.allObjects {
                guard let observer = object as? AUIControlControllerDidValueChangedObserver else { continue }
                observer.controlControllerDidValueChanged(self)
            }
        }
    }
  
    // MARK: Minute Interval
  
    public var minuteInterval: Int = 1 {
        didSet {
            didSetMinuteInterval(oldValue)
        }
    }

    open func didSetMinuteInterval(_ oldValue: Int) {
        datePicker?.minuteInterval = minuteInterval
    }

    // MARK: UIDatePicker
  
    public var datePicker: UIDatePicker? {
        set { view = newValue }
        get { return view as? UIDatePicker }
    }
  
    open override func setupView() {
        super.setupView()
        datePicker?.datePickerMode = mode
        datePicker?.setDate(date, animated: false)
        datePicker?.minimumDate = minimumDate
        datePicker?.maximumDate = maximumDate
        datePicker?.locale = locale
        datePicker?.calendar = calendar
        datePicker?.timeZone = timeZone
        datePicker?.countDownDuration = countDownDuration
        datePicker?.minuteInterval = minuteInterval
    }
  
    // MARK: Events
  
    open override func valueChangedEventAction() {
        super.valueChangedEventAction()
        if let date = datePicker?.date {
            setDate(date, animated: true)
        }
        if let countDownDuration = datePicker?.countDownDuration {
            self.countDownDuration = countDownDuration
        }
    }
  
}
