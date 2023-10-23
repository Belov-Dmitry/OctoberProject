//
//  PetMediaCollectionItems.swift
//  OctoberProject
//
//  Created by Dmitry Belov on 15.10.2023.
//

import UIKit
struct PetMediaCollectionItem {
    let type: PetMediaCollectionItemType
}

enum PetMediaCollectionItemType {
    case PetMediaCell
    case PetLoadMediaCell
}
