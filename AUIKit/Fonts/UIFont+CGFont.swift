import UIKit

public extension UIFont {

    var cgFont: CGFont? {
        return CGFont(fontName as NSString)
    }

}
