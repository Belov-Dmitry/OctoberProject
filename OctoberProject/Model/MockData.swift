//
//  MockData.swift
//  OctoberProject
//
//  Created by Mishana on 18.10.2023.
//

import UIKit

struct MockData {
    static let shared = MockData()
    
    
    private let navigation: Resources.CollectionViewSection = {
        .navigation(Resources.CollectionViewRow.navigation(ButtonsNavigationCell()))
//        .navigation(ButtonsNavigationCell())
    }()
    
    private let border: Resources.CollectionViewSection = {
        .border(Resources.CollectionViewRow.border(UIView()))
//        .border(UIView())
    }()
    
    private let messages: Resources.CollectionViewSection = {
        .messages(Resources.CollectionViewRow.message([
            .init(image: "German", title: "German", subtitle: "", location: "500 m", online: true, selectedStar: false),
            .init(image: "German", title: "Bima", subtitle: "", location: "1 km", online: true, selectedStar: false),
            .init(image: "German", title: "Archi", subtitle: "", location: "2.5 km", online: true, selectedStar: false)
        ]))
    }()
    private let selectedMessages: Resources.CollectionViewSection = {
        .selectedMessage(Resources.CollectionViewRow.selectedMessage([
            .init(image: "German", title: "German", subtitle: "", location: "500 m", online: true, selectedStar: true),
            .init(image: "German", title: "Bima", subtitle: "", location: "1.7 km", online: false, selectedStar: true),
            .init(image: "German", title: "Archi", subtitle: "", location: "", online: true, selectedStar: true)
        ]))
    }()
    
    
    var pageData: [Resources.CollectionViewSection] {
        [ navigation, border , messages, selectedMessages]
    }
}
