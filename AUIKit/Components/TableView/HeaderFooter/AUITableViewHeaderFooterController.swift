import UIKit

public protocol AUITableViewHeaderFooterController: AnyObject {
    func view() -> UITableViewHeaderFooterView?
    var estimatedHeight: CGFloat { get }
    var height: CGFloat { get }
    func willDisplay()
    func didEndDisplaying()
}
