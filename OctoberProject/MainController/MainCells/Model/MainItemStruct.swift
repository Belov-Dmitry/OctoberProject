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

struct CharacterStruct {
    let personName: String?
    let personPhoto: UIImage?
    let personData: String?
    let personPhone: String?
    let isPersonMan: Bool?
    let personMail: String?
    let currentPass: String?
    let newPass: String?
    let location: String?
    let petName: String?
    let petPhoto: UIImage?
    let petBirthday: String?
    let petData: String?
    let isPetMan: Bool?
    let petBreed: String?
}
