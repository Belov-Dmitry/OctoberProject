//
//  MainModel.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 08.12.2023.
//

import Foundation
import UIKit

struct MainModel {
    var items: [PostItemType] = [
        .mainHeaderCell(MainHeaderCellStruct(
            personPhoto: UIImage(named: "person")!,
            petPhoto: UIImage(named: "pet")!,
            personName: "Никита",
            petName: "Арчи",
            onlineIndicator: true,
            timeForAWalkLabel: "На прогулке еще 15 минут",
            settingsButton: true,
            dialogButton: true)),
        .mainPersonInfoCell(MainPersonInfoCellStruct(
            personData: "Нажмите, чтобы редактироватьНажмите, чтобы редактироватьНажмите, чтобы редактироватьНажмите, чтобы редактировать")),
        .mainPetInfoCell(MainPetInfoCellStruct(
            petPhoto: UIImage(named: "pet")!,
            petName: "Арчи",
            petGender: "genderMale",
            petLocation: "Алтайский край, Барнаул",
            petData: "Нажмите, чтобы редактироватьНажмите, чтобы редактироватьНажмите, чтобы редактироватьНажмите, чтобы редактировать"))
    ]
    
    
    var item: [CharacterStruct] = [
        CharacterStruct(personName: "Никита",
                        personPhoto: UIImage(named: "person") ?? UIImage(named: "Man")!,
                        personData: "Нажмите, чтобы редактироватьНажмите, чтобы редактироватьНажмите, чтобы редактироватьНажмите, чтобы редактировать",
                        personPhone: "+79339333333",
                        isPersonMan: true,
                        personMail: "nikita@inbox.ru",
                        currentPass: "",
                        newPass: "",
                        location: "Алтайский край, Барнаул",
                        petName: nil,
                        petPhoto: nil,
                        petBirthday: nil,
                        petData: nil,
                        isPetMan: nil,
                        petBreed: nil),
        CharacterStruct(personName: nil,
                        personPhoto: nil,
                        personData: nil,
                        personPhone: nil,
                        isPersonMan: nil,
                        personMail: nil,
                        currentPass: nil,
                        newPass: nil,
                        location: "Алтайский край, Барнаул",
                        petName: "Арчи",
                        petPhoto: UIImage(named: "pet")!,
                        petBirthday: "10112002",
                        petData: "Нажмите, чтобы редактироватьНажмите, чтобы редактироватьНажмите, чтобы редактироватьНажмите, чтобы редактировать",
                        isPetMan: true,
                        petBreed: "котэ"),
        CharacterStruct(personName: nil,
                        personPhoto: nil,
                        personData: nil,
                        personPhone: nil,
                        isPersonMan: nil,
                        personMail: nil,
                        currentPass: nil,
                        newPass: nil,
                        location: nil,
                        petName: nil,
                        petPhoto: nil,
                        petBirthday: nil,
                        petData: nil,
                        isPetMan: nil,
                        petBreed: nil)
    ]
    
    
}
