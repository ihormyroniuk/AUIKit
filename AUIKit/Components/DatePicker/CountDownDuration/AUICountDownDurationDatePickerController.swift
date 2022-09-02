import UIKit

public protocol AUICountDownDurationDatePickerController: AUIControlController {
    
    // MARK: - UIDatePicker
  
    var datePicker: UIDatePicker? { get set }
  
    // MARK: - Count Down Duration
  
    var countDownDuration: TimeInterval { get set }
  
    // MARK: - Minute Interval
  
    var minuteInterval: Int { get set }

}
