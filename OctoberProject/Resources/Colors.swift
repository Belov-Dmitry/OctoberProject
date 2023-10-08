//
//  Colors.swift
//  OctoberProject
//
//  Created by Вячеслав on 08.10.2023.
//

import Foundation
import UIKit

final class Colors {
    public static let buttonColor = UIColorUtils.CreateFromRGB(red: 29, green: 133, blue: 255)
    
    public static let buttonColor2 = UIColorUtils.CreateFromRGB(red: 111, green: 119, blue: 132)
    
    public static let borderColor = UIColorUtils.CreateFromRGB(red: 233, green: 232, blue: 236)
}

public class UIColorUtils {
    public static func CreateFromRGB(red: uint, green: uint, blue: uint) -> UIColor {
        return UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1)
    }
}
