import UIKit

public extension UIColor {
    
    // MARK: Initializer
    
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
    convenience init(red8Bits: UInt8, green8Bits: UInt8, blue8Bits: UInt8) {
        self.init(red: CGFloat(red8Bits) / CGFloat(UInt8.max), green: CGFloat(green8Bits) / CGFloat(UInt8.max), blue: CGFloat(blue8Bits) / CGFloat(UInt8.max), alpha: 1)
    }
    
    // MARK: Components
    
    var componentsRGB: (red: CGFloat, green: CGFloat, blue: CGFloat) {
        let color = CIColor(color: self)
        return (color.red, color.green, color.blue)
    }
    
}
