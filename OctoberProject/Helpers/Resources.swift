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
        static let white = UIColor(.white)
    }
    enum Images {
        
        enum MessageCollectionCell {
            static let starFill = UIImage(named: "ActiveStar")
            static let star = UIImage(named: "NoActiveStar")
            static let online = UIImage(systemName: "circle.fill")
        }
        enum TabBar {
            static func icon(for tab: Tab) -> UIImage? {
                switch tab {
                case .profile: return UIImage(named: "ProfileIcon")
                case .map: return UIImage(named: "MapIcon")
                case .message: return UIImage(named: "MessageIcon")
                }
            }
        }
    }
    
    enum CollectionView {
        case navigation
        case messages
        case selectedMessage
        case border
        
    }
    enum CollectionViewSection: Hashable {
        case navigation(CollectionViewRow)
        case border(CollectionViewRow)
        case messages(CollectionViewRow)
        case selectedMessage(CollectionViewRow)
        var numberOfSection: Int {
            switch self{
            case .navigation(let model):
                return model.numberOfItems
            case .border(let model):
                return model.numberOfItems
            case .messages(let model):
                return model.numberOfItems
            case .selectedMessage(let model):
                return model.numberOfItems
            }
        }
    }
    
    enum CollectionViewRow: Hashable {
        case navigation(ButtonsNavigationCell)
        case border(UIView)
        case message([CollectionMessageCell])
        case selectedMessage([CollectionMessageCell])
        
        var numberOfItems: Int {
            switch self {
            case .navigation(_):
                return 1
            case .border(_):
                return 1
            case .message(let model):
                return model.count
            case .selectedMessage(let model):
                return model.count
            }
        }
    }
    
    enum Strings {
    }
    enum Fonts {
    }
}
