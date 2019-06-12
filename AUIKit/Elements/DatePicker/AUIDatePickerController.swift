//
//  AUIDatePickerController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/17/19.
//

import UIKit

public protocol AUIDatePickerController: AUIControlController {
  
  // MARK: Mode
  
  var mode: UIDatePicker.Mode { get set }
  
  // MARK: Date
  
  var date: Date { get set }
  
  // MARK: Minimum Date
  
  var minimumDate: Date? { get set }
  
  // MARK: Maximum Date
  
  var maximumDate: Date? { get set }
  
  // MARK: Locale
  
  var locale: Locale? { get set }
  
  // MARK: Calendar
  
  var calendar: Calendar { get set }
  
  // MARK: Time Zone
  
  var timeZone: TimeZone? { get set }
  
  // MARK: Count Down Duration
  
  var countDownDuration: TimeInterval { get set }
  
  // MARK: Minute Interval
  
  var minuteInterval: Int { get set }

}
