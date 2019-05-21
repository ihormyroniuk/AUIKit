//
//  AUIDefaultDatePickerController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/17/19.
//

import UIKit

open class AUIDefaultDatePickerController: AUIDefaultControlController, AUIDatePickerController {
  
  // MARK: UIDatePicker
  
  public var datePicker: UIDatePicker? {
    set { view = newValue }
    get { return view as? UIDatePicker }
  }
  
  // MARK: Delegates
  
  public weak var didSelectDateDelegate: AUIDatePickerControllerDidSelectDateDelegate?
  
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
  
  public var date: Date = Date() {
    didSet {
      didSetDate(oldValue)
    }
  }
  
  open func didSetDate(_ oldValue: Date) {
    if oldValue != date {
      datePicker?.setDate(date, animated: true)
      didSelectDateDelegate?.datePickerController(self, didSelectDate: date)
    }
  }
  
  public var minimumDate: Date? = nil {
    didSet {
      didSetMinimumDate(oldValue)
    }
  }
  
  open func didSetMinimumDate(_ oldValue: Date?) {
    datePicker?.minimumDate = minimumDate
    if let minimumDate = minimumDate, minimumDate > date {
      date = minimumDate
    }
  }
  
  public var maximumDate: Date? = nil {
    didSet {
      didSetMaximumDate(oldValue)
    }
  }
  
  open func didSetMaximumDate(_ oldValue: Date?) {
    datePicker?.maximumDate = maximumDate
    if let maximumDate = maximumDate, maximumDate < date {
      date = maximumDate
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
  
  public var calendar: Calendar = Calendar.current {
    didSet {
      didSetCalendar(oldValue)
    }
  }
  
  open func didSetCalendar(_ oldValue: Calendar) {
    datePicker?.calendar = calendar
  }
  
  public var timeZone: TimeZone? {
    didSet {
      didSetTimeZone(oldValue)
    }
  }
  
  open func didSetTimeZone(_ oldValue: TimeZone?) {
    datePicker?.timeZone = timeZone
  }
  
  // MARK:
  
  public var countDownDuration: TimeInterval = 0.0 {
    didSet {
      didSetCountDownDuration(oldValue)
    }
  }
  
  open func didSetCountDownDuration(_ oldValue: TimeInterval) {
    datePicker?.countDownDuration = countDownDuration
  }
  
  public var minuteInterval: Int = 1 {
    didSet {
      didSetMinuteInterval(oldValue)
    }
  }

  open func didSetMinuteInterval(_ oldValue: Int) {
    datePicker?.minuteInterval = minuteInterval
  }
  
  // MARK: View
  
  open override func setupView() {
    super.setupView()
    datePicker?.date = date
    datePicker?.minimumDate = minimumDate
    datePicker?.maximumDate = maximumDate
    datePicker?.datePickerMode = mode
    datePicker?.locale = locale
    datePicker?.calendar = calendar
    datePicker?.timeZone = timeZone
    datePicker?.countDownDuration = countDownDuration
    datePicker?.minuteInterval = minuteInterval
  }
  
  // MARK: Events
  
  open override func valueChangedEventAction() {
    if let date = datePicker?.date {
      self.date = date
    }
    super.valueChangedEventAction()
  }
  
}
