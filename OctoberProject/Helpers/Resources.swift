//
//  Resources.swift
//  OctoberProject
//
//  Created by Mishana on 08.10.2023.
//

import UIKit

enum Resources {
    enum Colors {
        static let gray = UIColor(named: "Gray")
        static let lightGray = UIColor(named: "LightGray")
        static let darkGray = UIColor(named: "DarkGray")
        
        static let blue = UIColor(named: "Blue")
        static let lightBlue = UIColor(named: "LightBlue")
        
        static let pink = UIColor(named: "Pink")
        static let lightPink = UIColor(named: "LightPink")
        
        static let dark = UIColor(named: "Dark")
        static let green = UIColor(named: "Green")
        static let orange = UIColor(named: "Orange")
    }
    
    enum Images {
        enum TabBar {
            static func icon(for tab: Tab) -> UIImage? {
                switch tab {
                case .profile: return UIImage(named: "ProfileIcon")
                case .map: return UIImage(named: "MapIcon")
                case .message: return UIImage(named: "MessageIcon")
                }
            }
        }
        
        enum Message {
            
        }
    }
    
    enum Strings {
        
    }
    enum Fonts {
        
    }
}
