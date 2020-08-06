//
//  AUIEmptyCountDownDurationDatePickerController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 28.07.2020.
//

import UIKit

open class AUIEmptyCountDownDurationDatePickerController: AUIEmptyControlController, AUICountDownDurationDatePickerController {
  
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
        datePicker?.datePickerMode = .countDownTimer
        datePicker?.countDownDuration = countDownDuration
        datePicker?.minuteInterval = minuteInterval
    }
  
    // MARK: Events
  
    open override func valueChangedEventAction() {
        super.valueChangedEventAction()
        if let countDownDuration = datePicker?.countDownDuration {
            self.countDownDuration = countDownDuration
        }
    }
  
}
