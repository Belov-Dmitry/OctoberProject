//
//  SettingsModelStruct.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 19.11.2023.
//

import Foundation
import UIKit

enum SettingsModel {
    case settingsTopCell(SettingsTopCellItemsType)
    case settingsPersonCell(SettingsPersonCellStruct)
    case settingsPetCell(SettingsPetCellStruct)
}
typealias SettingsTopCellItemsType = [SettingsTopCellStruct]

struct SettingsTopCellStruct {
    let foto: UIImage
    let name: String
    let isAddButtonVisible: Bool
    var isSelectedCell: Bool
}
struct SettingsPersonCellStruct {
    let personPhoto: UIImage
    let personPhone: String
    let personGender: Bool
    let personName: String
    let personLocation: String
    let personMail: String
    let currentPass: String
    let newPass: String
}
struct SettingsPetCellStruct {
    let petPhoto: UIImage
    let petGender: Bool
    let petBreed: String
    let petName: String
    let petBirthday: String
}
