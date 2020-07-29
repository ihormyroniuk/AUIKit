//
//  AUIDatePickerController.swift
//  AUIKit
//
//  Created by Ihor Myroniuk on 1/17/19.
//

import UIKit

public enum AUIDatePickerControllerMode {
    case time
    case date
    case dateAndTime
    
    var datePickerMode: UIDatePicker.Mode {
        switch self {
        case .time:
            return .time
        case .date:
            return .date
        case .dateAndTime:
            return .dateAndTime
        }
    }
}

public protocol AUIDatePickerController: AUIControlController {
  
    // MARK: Mode
  
    var mode: AUIDatePickerControllerMode { get set }
  
    // MARK: Date
  
    var date: Date { get }
    func setDate(_ date: Date, animated: Bool)
  
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

}
