//
//  AUIDatePickerController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/17/19.
//

import UIKit

public protocol AUIDatePickerControllerDidSelectDateDelegate: class {
  func datePickerController(_ datePickerController: AUIControlController, didSelectDate selectedDate: Date)
}

public protocol AUIDatePickerController: AUIControlController {
  
  // MARK: UIDatePicker
  
  var datePicker: UIDatePicker? { get set }
  
  // MARK: Delegate
  
  var didSelectDateDelegate: AUIDatePickerControllerDidSelectDateDelegate? { get set }
  
  // MARK: Mode
  
  var mode: UIDatePicker.Mode { get set }
  
  // MARK: Data
  
  var date: Date { get set }
  var minimumDate: Date? { get set }
  var maximumDate: Date? { get set }
  
  // MARK: Locale
  
  var locale: Locale? { get set }
  var calendar: Calendar { get set }
  var timeZone: TimeZone? { get set }
  
  // MARK: 
  
  var countDownDuration: TimeInterval { get set }
  var minuteInterval: Int { get set }
  
}
