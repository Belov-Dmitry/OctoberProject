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
