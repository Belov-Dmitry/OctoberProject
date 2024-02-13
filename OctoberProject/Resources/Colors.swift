import Foundation
import UIKit

final class Colors {
    public static let loginBackgroundColor = UIColorUtils.createFromRGB(red: 55, green: 109, blue: 254)
    public static let restorePasswordBacgroundColor = UIColorUtils.createFromRGB(red: 249, green: 249, blue: 251)

    public static let buttonColor = UIColorUtils.createFromRGB(red: 29, green: 133, blue: 255)
    
    public static let buttonColor2 = UIColorUtils.createFromRGB(red: 111, green: 119, blue: 132)
    
    public static let borderColor = UIColorUtils.createFromRGB(red: 233, green: 232, blue: 236)
}

public class UIColorUtils {
    public static func createFromRGB(red: uint, green: uint, blue: uint) -> UIColor {
        return UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1)
    }
}
