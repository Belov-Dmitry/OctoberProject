//
//  MainItemStruct.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 01.11.2023.
//

import Foundation
import UIKit

enum PostItemType {
    case mainHeaderCell(MainHeaderCellStruct)
    case mainPersonInfoCell(MainPersonInfoCellStruct)
    case mainPetInfoCell(MainPetInfoCellStruct)
}
struct MainHeaderCellStruct {
    let personPhoto: UIImage
    let petPhoto: UIImage
    let personName: String
    let petName: String
    let onlineIndicator: Bool
    let timeForAWalkLabel: String
    let settingsButton: Bool
    let dialogButton: Bool
}
struct MainPersonInfoCellStruct {
    let personData: String
}
struct MainPetInfoCellStruct {
    let petPhoto: UIImage
    let petName: String
    let petGender: String
    let petLocation: String
    let petData: String
}
struct PetMediaCollectionItems {
    let type: PetMediaCollectionItemsType
}
enum PetMediaCollectionItemsType {
    case petMediaCell
    case petLoadMediaCell
}

protocol TopCollectionViewItem {
    var name: String { get set }
    var avatar: String { get set }
    var isAddButtonVisible: Bool? { get set }
    var isSelectedCell: Bool? { get set }
}
struct PersonStruct: TopCollectionViewItem {
    var name: String
    var avatar: String
    var personData: String?
    var personPhone: String?
    var isPersonMan: Bool?
    var personMail: String?
    var currentPass: String?
    var newPass: String?
    var location: String?
    var isAddButtonVisible: Bool?
    var isSelectedCell: Bool?
    var pet: [PetStruct]?
}
struct PetStruct: TopCollectionViewItem {
    var name: String
    var avatar: String
    var petBirthday: String?
    var petData: String?
    var isPetMan: Bool?
    var petBreed: String?
    var isAddButtonVisible: Bool?
    var isSelectedCell: Bool?
}
